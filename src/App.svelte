<script>
	import { Router, Route, Link } from "svelte-routing";
	import Terms from "./Terms.svelte";
    import Home from "./Home.svelte";
    import Privacy from "./Privacy.svelte";

	export let url = "";
</script>

<div>
	<Router url="{url}" >
		<!-- We create empty routing links so we can programmatically route the app using href without using the nav bar. -->
		<nav class="router_test">
			<Link to="/"></Link>
			<Link to="/terms"></Link>
			<Link to="/privacy"></Link>
		</nav>
		
		<div>
			<Route path="/" component="{Home}" />
			<Route path="/terms" component="{Terms}" />
			<Route path="/privacy" component="{Privacy}" />
		</div>
	</Router>
</div>

<style>
	.router_test {
		background-color: midnightblue;
	}
</style>