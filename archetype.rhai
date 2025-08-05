let context = #{};

// This generally comes from ANSWERS, but prompting for it ensures it is in the context 
context += prompt("Project Author:", "author_full", #{
    placeholder: "Your Name <your.name@example.com>",
});

context += prompt("Wrapper prefix:", "wrapper-prefix", #{
  cases: [
    CasedValue(KebabCase),
  ],
  defaults_with: "p6m",
});

context += prompt("Chart to wrap:", "wrapped-chart", #{
  cases: [
    CasedValue(KebabCase),
  ],
});

context += prompt("Repository of chart to wrap:", "wrapped-repository", #{
  cases: [
    CasedValue(KebabCase),
  ],
});

context += prompt("Version of chart to wrap:", "wrapped-chart-version", );

context += prompt("Description:", "description", #{
  defaults_with: "Custom Helm chart for " + context["wrapped-chart"] + " maintained by " + context["wrapper-prefix"],
});

context["project-name"] = context["wrapper-prefix"] + "-" + context["wrapped-chart"];

render(Directory("contents"), context)
