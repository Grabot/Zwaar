<script>
	import { onMount } from "svelte";

    let logoImage = "/images/Zwaar_Logo.png";
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
<h1 class="centered_text" id="developers_text" style='--image_width:{image_width};'><strong><b>Developers</b></strong></h1>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<h3 class="centered_text">Thank you for visiting Zwaar Developers</h3>
<br>
<h3 class="centered_text">If you want to get in touch with the team to ask for our services,</h3>
<br>
<h3 class="centered_text">please download our app "<i>Brocast</i>" and send a message to "<i>Sander</i> 🥰"</h3>
<br>
<h3 class="centered_text">Or send an email to the CEO at "<i>SanderKools@zwaar.dev</i>"</h3>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<style>
    #developers_text {
        padding-left: clamp(0px, calc( var(--image_width) * 0.1px ), 60px);
        color:grey;
        font-size: clamp(0px, calc( var(--image_width) * 0.07px ), 42px);
        filter: drop-shadow( 1px  0px 0px white) 
				drop-shadow(-1px  0px 0px white)
				drop-shadow( 0px  1px 0px white) 
				drop-shadow( 0px -1px 0px white);
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
    .shadow_text {
		fill: #FFF;
		filter: drop-shadow( 1px  0px 0px black) 
				drop-shadow(-1px  0px 0px black)
				drop-shadow( 0px  1px 0px black) 
				drop-shadow( 0px -1px 0px black);
	}
</style>