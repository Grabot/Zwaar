<script>
	import { Router, Route, Link } from "svelte-routing";
	import Terms from "./Terms.svelte";
    import Home from "./Home.svelte";
    import Privacy from "./Privacy.svelte";
    import Art from "./Art.svelte";
    import Team from "./Team.svelte";

	export let url = "";
</script>

<div>
	<Router url="{url}" >
		<!-- We create empty routing links so we can programmatically route the app using href without using the nav bar. -->
		<nav class="router_bar">
			<Link to="/"></Link>
			<Link to="/team"></Link>
			<Link to="/art"></Link>
			<Link to="/terms"></Link>
			<Link to="/privacy"></Link>
		</nav>
		
		<div>
			<Route path="/" component="{Home}" />
			<Route path="/team" component="{Team}" />
			<Route path="/art" component="{Art}" />
			<Route path="/terms" component="{Terms}" />
			<Route path="/privacy" component="{Privacy}" />
		</div>
	</Router>
</div>

<style>
	.router_bar {
		background-color: midnightblue;
	}
</style>