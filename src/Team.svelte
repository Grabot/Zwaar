<script>
	import { onMount } from "svelte";

    let logoImage = "/images/Zwaar_Logo.png";
    let founderImage = "/images/founder.png";
    let coFounderImage = "/images/co_founder.png";
    let CEOImage = "/images/CEO.png";
    let CTOImage = "/images/CTO.png";
    let humanResourcesImage = "/images/HumanResources.png";
    let importExportImage = "/images/import_export.png";
    let contentManagerImage = "/images/content_manager.png";
    // We again use the screenbox to find the screen resolution, but this time we only want the width.
    // Which is good because the height can be very large and we will allow scrolling this time.
    // So we set the screenbox to screenwidth and height of 1
    let screenBox;
	let screenWidth = -1;
	let screenHeight = -1;

    let image_width = screenWidth;
    
    onMount(() => {
		const resizeObserver = new ResizeObserver(entries => {
			const entry = entries.at(0);

			screenWidth = entry.contentRect.width;
            image_width = screenWidth;
			screenHeight = entry.contentRect.height;
		});
		resizeObserver.observe(screenBox);
		return () => resizeObserver.unobserve(screenBox);
	});
</script>

<div class="screen_box" bind:this={screenBox}></div>

<div class="container">
    <img class="container_image" style='--image_width:{image_width};' src={logoImage} alt="logo" />
</div>
<h1 class="centered_text" id="developers_text" ><strong><b>Developers</b></strong></h1>

<br>
<br>

<h2 class="centered_text">Meet the Team:</h2>
<br>
<p class="centered_text">We are fortunate to have such a dedicated and accomplished team with a wide range of expertise.</p>
<p class="centered_text">Together, they're helping making the world a better place</p>
<br>
<br>
<br>
<div class="table" style='--table_width:{image_width};'>
    <div class="row">
        <div class="column_image">
            <img class="person_image" style='--image_width:{image_width};' src={founderImage} alt="founder" />
        </div>
        <div class="column_text">
            <div><h3>Founder: Sander</h3></div>
            <div>Sander Kools is the founder and self-proclaimed tech visionary of Zwaar Developers. He started the company from his garage, which he first had to build himself. His daily routine consists of biohacking his sleep cycle to increase productivity and macro dosing LSD for increased creativity. Right now he's in the top 1% of both the most creative and most productive people in the world. Coupled with his impressive nootropic supplement stack, which makes his mental ability one of the best in the world, there is not a problem in the world that he couldn't solve. He is however very difficult to reach, since he doesn't have a phone and he never checks his emails.<br>He came up with the idea for Zwaar while meditating in a sensory deprivation pod. The rest is history and Zwaar developers quickly became one of the biggest development companies in his area.</div>
            <div><i>"I am proud of the company I was able to build with so many great minds. Despite these other minds I was still able to build it.</i></div>
        </div>
    </div>
    <div class="row">
        <div class="column_text">
            <div><h3>Co-Founder: Sander</h3></div>
            <div>Sander Kools is the co-founder of the company. Along with the founder he came up with the ideas that made the company what it is today. There is no doubt in the genius of the 2 founders, their products and services are proof of that.</div>
            <div><i>"I met Sander at a festival and sold him some drugs. After that I just kinda stuck around."</i></div>
        </div>
        <div class="column_image">
            <img class="person_image" style='--image_width:{image_width};' src={coFounderImage} alt="co-founder" />
        </div>
    </div>
    <div class="row">
        <div class="column_image">
            <img class="person_image" style='--image_width:{image_width};' src={CEOImage} alt="ceo" />
        </div>
        <div class="column_text">
            <div><h3>CEO</h3></div>
            <div>Sander Kools joined the team after the founding. His prowess and technical skill quickly made him an integral part of the company. It was only obvious that someone with his skill and experience would some day lead the company.<br>Since he took over the role of CEO from Sander the company has seen a meteoric rise.<br>(It's the guy, not the dog)</div>
            <div><i>"Who are you and why are you not working?! You're FIRED!"</i></div>
        </div>
    </div>
    <div class="row">
        <div class="column_text">
            <div><h3>CTO</h3></div>
            <div>Sander Kools started out as a fan of the company, using its products and services. In his free time he would find and fix bugs within these products and services that he loved. He was quickly brought in as part of the team and his contributions made these products and services incredibly solid.<br>His intelligence and understanding of the company software quickly made him the CTO, which he was always meant to be.<br>(It's the cat, not the guy)</div>
            <div><i>"Meouw!"</i></div>
        </div>
        <div class="column_image">
            <img class="person_image" style='--image_width:{image_width};' src={CTOImage} alt="cto" />
        </div>
    </div>    
    <div class="row">
        <div class="column_image">
            <img class="person_image" style='--image_width:{image_width};' src={contentManagerImage} alt="human-resources" />
        </div>
        <div class="column_text">
            <div><h3>Content manager</h3></div>
            <div>Sander Kools was brought in at a time when it was difficult to manage all the content that Zwaar was putting out. All of this content was just pilling up and being un-managed. After he was brought in to fix this problem all the content was quickly managed.</div>
            <div><i>"I love content! yum yum!"</i></div>
        </div>
    </div>
    <div class="row">
        <div class="column_text">
            <div><h3>Import/Export</h3></div>
            <div>One of the major issues that Zwaar faced was the ability to get items into the company and also to get items out of the company. For this astronomically difficult task they had to find the right person, which they did. After Max Sumrall was brought in as Import/Export expert there have been no more issues with stuff going in or stuff going out!</div>
            <div><i>"Few things in life are as eloquent or beautiful as Export. When I'm exporting I get chills and it makes me happy. There is only one thing I love more in life than Export and that is Import"</i></div>
        </div>
        <div class="column_image">
            <img class="person_image" style='--image_width:{image_width};' src={importExportImage} alt="content-manager" />
        </div>
    </div>
    <div class="row">
        <div class="column_image">
            <img class="person_image" style='--image_width:{image_width};' src={humanResourcesImage} alt="human-resources-again" />
        </div>
        <div class="column_text">
            <div><h3>Human Resources</h3></div>
            <div>A useless role</div>
            <div><i>"Makro"</i></div>
        </div>
    </div>
</div>

<style>
    #developers_text {
        padding-left: 80px;
        color:grey
    }
    .centered_text {
        text-align:center;
        padding: 0px;
        margin: 0px;
    }
    .container {
      text-align: center;
      margin-top: 20px;
    }
    .container_image {
        height:auto;
        width: calc( var(--image_width) * 1px );
        max-width:600px;
    }
    .person_image {
        height: 100%;
        width: 100%;
    }
    .screen_box {
		background-color: #131619;
		width: 100vw;
		height: 1;
	}

    .column_image {
        float: left;
        width: 30%;
        padding: 20px;
    }
    .column_text {
        float: left;
        width: 70%;
        display: grid;
        place-items: center;
        padding: 20px;
    }
    .row:after {
        content: "";
        display: table;
        clear: both;
    }
    .row {
        display: flex;
    }
    .table {
        width: calc( var(--table_width) * 1px );
        max-width:1500px;
        margin-left: auto;
        margin-right: auto;
        display: table;
    }
</style>