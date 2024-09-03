<script>
	import { onMount } from "svelte";

    let logoImage = "/images/Zwaar_Logo.png";
    let founderImage = "/images/founder.png";
    let coFounderImage = "/images/co_founder.png";
    let CEOImage = "/images/CEO.png";
    let CTOImage = "/images/CTO.png";
    let humanResourcesImage = "/images/HumanResources.jpeg";
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

			// The width of a single hexagon is 2 * hexSize but there is overlap
			// 3 hexagons next to each other will be 5 * hexSize in width.
			// We determine the hexSize to be the screen width divided by 20
			// Which means we will need 14 hexagons in the width.
			// So we will create 7 layers
			if (screenWidth > screenHeight) {
				hexSize = screenWidth / 20;
			} else {
				hexSize = screenHeight / 20;
			}
			for (let i = 0; i <= hex.length - 1; i++) {
				hex[i].updateHexagon(hexSize);
				zwaarLogo.updateHexagon(hexSize);
			}
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
        <div class="column_text">This is the founder</div>
    </div>
    <div class="row">
        <div class="column_text">This is the co founder</div>
        <div class="column_image">
            <img class="person_image" style='--image_width:{image_width};' src={coFounderImage} alt="co-founder" />
        </div>
    </div>
    <div class="row">
        <div class="column_image">
            <img class="person_image" style='--image_width:{image_width};' src={CEOImage} alt="ceo" />
        </div>
        <div class="column_text">This is the CEO</div>
    </div>
    <div class="row">
        <div class="column_text">This is the CTO</div>
        <div class="column_image">
            <img class="person_image" style='--image_width:{image_width};' src={CTOImage} alt="cto" />
        </div>
    </div>
    <div class="row">
        <div class="column_image">
            <img class="person_image" style='--image_width:{image_width};' src={importExportImage} alt="import-export" />
        </div>
        <div class="column_text">This is the Import Export</div>
    </div>
    <div class="row">
        <div class="column_text">This is the content manager</div>
        <div class="column_image">
            <img class="person_image" style='--image_width:{image_width};' src={contentManagerImage} alt="content-manager" />
        </div>
    </div>
    <div class="row">
        <div class="column_image">
            <img class="person_image" style='--image_width:{image_width};' src={humanResourcesImage} alt="human-resources" />
        </div>
        <div class="column_text">This is the Human Resources</div>
    </div>
    <div class="row">
        <div class="column_text">This is the Human Resources again</div>
        <div class="column_image">
            <img class="person_image" style='--image_width:{image_width};' src={humanResourcesImage} alt="human-resources-again" />
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
    }
    .column_text {
        float: left;
        width: 70%;
        display: grid;
        place-items: center;
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
        max-width:1200px;
        margin-left: auto;
        margin-right: auto;
        display: table;
    }
</style>