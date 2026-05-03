## Step 5: Sharing Agents with Docker Registry

By now, you should have a couple of agents, and maybe one that already does something useful. Wouldn't it be nice if we could share agents with others?

Sharing agents with Docker Agent is extremely simple - you can push and pull agents to any OCI registry.

### Setting Up Your Docker Hub ID

Because you will be pushing and pulling agents from Hub, you need to be authenticated.

::variableDefinition[dockerhubid]{prompt="What is your Docker Hub username?"}

Make sure you're logged in to Docker Hub:

```bash
docker login
```

### Push Your Agent

Push your developer agent using the following `docker agent push` command:

```bash
docker agent share developer.yaml $$dockerhubid$$/docker-agent-developer
```

### Pull an Agent

Pull your agent on any other machine by using the `docker agent pull` command:

```bash
docker agent share $$dockerhubid$$/docker-agent-developer
```

### Run Directly from Registry

You can also use `docker agent run` with a reference to an agent stored in a registry:

```bash
docker agent run $$dockerhubid$$/docker-agent-developer
```


## Next Steps

In Step 6, we'll explore multi-agent systems and sub-agents.
