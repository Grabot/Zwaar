<script>
	import { onMount } from "svelte";

    let logoImage = "/images/Zwaar_Logo.png";
    // We again use the screenbox to find the screen resolution, but this time we only want the width.
    // Which is good because the height can be very large and we will allow scrolling this time.
    // So we set the screenbox to screenwidth and height of 1
    let screenBox;
	let screenWidth = -1;
    let innerWidth = 0
    let innerHeight = 0
    $: normalMode = innerWidth*1.33 >= innerHeight

    let image_width = screenWidth;
    
    onMount(() => {
		const resizeObserver = new ResizeObserver(entries => {
			const entry = entries.at(0);

			screenWidth = entry.contentRect.width;
            image_width = screenWidth;
		});
		resizeObserver.observe(screenBox);
		return () => resizeObserver.unobserve(screenBox);
	});

</script>

<div class="screen_box" bind:this={screenBox}></div>

<div class="art_content">
    <div class="container">
        <img class="container_image" style='--image_width:{image_width};' src={logoImage} alt="logo" />
    </div>
    <h1 class="centered_text" id="developers_text" style='--image_width:{image_width};'><strong><b>Developers</b></strong></h1>
</div>

<svelte:window bind:innerWidth bind:innerHeight />
<style>
    #developers_text {
        padding-left: clamp(0px, calc( var(--image_width) * 0.1px ), 60px);
        color:grey;
        font-size: clamp(0px, calc( var(--image_width) * 0.07px ), 42px);
        font-size: 40px;
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
</style>