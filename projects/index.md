---
title: Current CNERG Projects
---
<article>

{% assign cnerg_pis = site.data.people[0].people %}
{% assign all_cnerg = cnerg_pis | concat: site.data.people[1].people %}
{% assign all_cnerg = all_cnerg | concat: site.data.people[2].people %}

{% for area in site.data.areas %}
    {% assign area_projects = site.data.projects | where_exp: "project", "project.area_code == area.code" %}
    <section>
    <h2>{{ area.title }}</h2>
    <div class="container">
        {% for project in area_projects %}
            {% assign lead_pi = None %}
            {% assign lead_pi_array = site.data.collaborators | 
                where_exp: "person", "person.code == project.lead_pi" %}
            {% if lead_pi_array.size > 0 %}
                {% assign lead_pi = lead_pi_array[0] %}
                {% assign cnerg_pi_code = project.cnerg_pi %}
            {% else %}
                {% assign cnerg_pi_code = project.lead_pi %}
            {% endif %}
            <div class="col-sm-12">
                <span class="font-weight-bold">
                {% if project.project_url != null %}
                    <a href="{{ project.project_url }}" target="_blank">{{ project.title }}</a> 
                {% else %}
                    {{ project.title }}
                {% endif %}
                </span>
                <br><span class="font-italic">Lead PI: </span>
                {% if lead_pi != None %}
                    {% if lead_pi.url != "" %}
                        <a href="{{ lead_pi[0].url }}" target="_blank">{{ lead_pi.name }}</a> ({{ lead_pi.inst }})
                    {% else %}
                        {{ lead_pi.name }} ({{ lead_pi.inst }})
                    {% endif %}
                    <br><span class="font-italic">CNERG PI: </span>
                {% endif %}
                {% assign cnerg_pi = cnerg_pis | 
                    where_exp: "person", "person.url == cnerg_pi_code"  %}
                <a href="{{ site.base_url }}/community/people/{{ cnerg_pi_code }}/">{{ cnerg_pi[0].name }}</a>
                        {% assign agency = site.data.agencies | where_exp: "agency", "agency.agency == project.agency" %}
                <br><span class="font-italic">Funding source:</span> {{ agency[0].name }}
                <br><span class="font-italic">Period of performance:</span> {{ project.start_date}} to {{ project.end_date}}
                <div class="row row-no-gutters">
                    <div class="col-sm-6 text-left">
                        <span class="font-italic">Other CNERG Collaborators:</span>
                        <ul>
                        {% for code in project.cnerg_collaborators %}
                            {% assign cnerg_collab = all_cnerg | 
                                where_exp: "person", "person.url == code"  %}
                            <li><a href="{{ site.base_url }}/community/people/{{ code }}/">{{ cnerg_collab[0].name }}</a></li>
                        {% endfor %}
                        </ul>
                    </div>
                    <div class="col-sm-6 text-left">
                        <span class="font-italic">Other Collaborators:</span>
                        <ul>
                        {% for collab_code in project.other_collaborators %}
                            {% assign collab = site.data.collaborators |
                                where_exp: "person", "person.code == collab_code" %}
                            <li>
                            {% if collab[0].url != "" %}
                                <a href="{{ collab[0].url }}" target="_blank">{{ collab[0].name }}</a> ({{ collab[0].inst }})
                            {% else %}
                                {{ collab[0].name }} ({{ collab[0].inst }})
                            {% endif %}
                            </li>
                        {% endfor %}
                        </ul>
                    </div>
                </div>
                {% if project.abstract != None %}
                    <div class="col-sm-2 text-left">
                        <a data-toggle="collapse" href="#abstract-{{ project.short_code }}" 
                            aria-expanded="false" aria-controls="abstract-{{ project.short_code }}">Abstract</a>
                    </div>
                    <div id="abstract-{{ project.short_code }}" class="collapse">
                        <div class="card card-body">{{ project.abstract }}</div>
                    </div>
                {% endif %}
                {% if project.pubs != None %}
                    {% assign pub_list = None %}
                    {% for pub_code in project.pubs %}
                        {% assign found_pubs = site.data.pub | where_exp: "item", 'item["bibtex"] contains pub_code' %}
                        {% assign pub_list = pub_list | concat: found_pubs %}
                    {% endfor %}
                    {% if pub_list.size > 0 %}
                        <div class="col-sm-2 text-left">
                            <a data-toggle="collapse" href="#pubs-{{ project.short_code }}" 
                                aria-expanded="false" aria-controls="pubs-{{ project.short_code }}">Publications</a>
                        </div>
                        <div id="pubs-{{ project.short_code }}" class="collapse">
                            <div class="card card-body">
                                <ul>
                                {% for pub in pub_list %}
                                    {% assign data = pub["data"] %}
                                    <li>
                                    {% for author in data["creators"] limit:max_authors %}
                                        {{ author["firstName"] }} {{ author["lastName"] }},
                                    {% endfor %}
                                    {% if data["creators"].size > max_authors %}
                                        <span class="font-italic">et al,</span>
                                    {% endif %}
                                    "{%- if data["url"] != "" %}<a href="{{ data['url'] }}" target="_blank">{{ data["title"] }}</a>
                                    {%- else %}{{ data["title"] }}{%- endif %}",
                                    {% if page.itemType == "journalArticle" %}
                                        <span class="font-italic">{{ data["publicationTitle"] }}</span>,
                                        <span class="font-weight-bold">{{ data["volume"] }}</span>,
                                        pp. {{ data["pages"] }} 
                                    {% elsif page.itemType == "conferencePaper" %}
                                        <span class="font-italic">{{ data["proceedingsTitle"] }}</span>,
                                    {% elsif page.itemType == "thesis" %}
                                        {{ data["thesisType"]  }}, {{ data["university"] }},
                                    {% endif %}
                                    ({{ data["date"] }})
                                    </li>
                                {% endfor %}
                                </ul>
                            </div>
                    </div>
                    {% endif %}
                {% endif %}
            </div>
            <hr>
        {% endfor %}
    </div>
    </section>
{% endfor %}

</article>