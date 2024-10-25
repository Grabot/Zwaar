<script>
	import { onMount } from "svelte";

    let logoImage = "/images/Zwaar_Logo.png";
    let founderImage = "/images/founder.png";
    let coFounderImage = "/images/co_founder.png";
    let CEOImage = "/images/CEO.png";
    let CTOImage = "/images/CTO.png";
    let CFOImage = "/images/CFO.png";
    let humanResourcesImage = "/images/HumanResources.png";
    let importExportImage = "/images/import_export.png";
    let contentManagerImage = "/images/content_manager.png";
    let socialMediaManager = "/images/SocialMediaManager.png"
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

<div class="team_content">
    <div class="container">
        <img class="container_image" style='--image_width:{image_width};' src={logoImage} alt="logo" />
    </div>
    <h1 class="centered_text" id="developers_text" style='--image_width:{image_width};'><strong><b>Developers</b></strong></h1>

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
        {#if normalMode == true}
            <div class="row">
                <div class="column_image">
                    <img class="person_image" style='--image_width:{image_width};' src={founderImage} alt="co-founder" />
                </div>
                <div class="column_text">
                    <div><h3>Founder: Sander Kools</h3></div>
                    <div>Sander Kools is the founder and self-proclaimed tech visionary of Zwaar Developers. He started the company from his garage, which he first had to build himself. His daily routine consists of biohacking his sleep cycle to increase productivity and macro dosing LSD for increased creativity. Right now he's in the top 1% of both the most creative and most productive people in the world. Coupled with his impressive nootropic supplement stack, which makes his mental ability one of the best in the world, there is not a problem in the world that he couldn't solve. He is however very difficult to reach, since he doesn't have a phone and he never checks his emails.<br>He came up with the idea for Zwaar while meditating in a sensory deprivation pod. The rest is history and Zwaar developers quickly became one of the biggest development companies in his area.</div>
                    <div><i>"I am proud of the company I was able to build with so many great minds. Despite these other minds I was still able to build it.</i></div>
                </div>
            </div>
        {:else}
            <div class="column_text_mobile">
                <div><h3>Founder: Sander Kools</h3></div>
            </div>
            <div class="column_image_mobile">
                <img class="person_image_mobile" style='--image_width:{image_width};' src={founderImage} alt="co-founder" />
            </div>
            <div class="column_text_mobile">
                <div>Sander Kools is the founder and self-proclaimed tech visionary of Zwaar Developers. He started the company from his garage, which he first had to build himself. His daily routine consists of biohacking his sleep cycle to increase productivity and macro dosing LSD for increased creativity. Right now he's in the top 1% of both the most creative and most productive people in the world. Coupled with his impressive nootropic supplement stack, which makes his mental ability one of the best in the world, there is not a problem in the world that he couldn't solve. He is however very difficult to reach, since he doesn't have a phone and he never checks his emails.<br>He came up with the idea for Zwaar while meditating in a sensory deprivation pod. The rest is history and Zwaar developers quickly became one of the biggest development companies in his area.</div>
                <br>
                <br>
                <div><i>"I am proud of the company I was able to build with so many great minds. Despite these other minds I was still able to build it.</i></div>
                <br>
                <br>
                <br>
            </div>
        {/if}

        {#if normalMode == true}
            <div class="row">
                <div class="column_text">
                    <div><h3>Co-Founder: Sander Kools</h3></div>
                    <div>Sander Kools is the co-founder and he was astronomical in helping found Zwaar Developers. His knowledge of modern business development and his unparalleled expertise in ideation synergy and market disruption to foster unprecedented innovation allowed the company to become what it is today. With a background in forward-thinking strategic alignment, his contributions are widely acknowledged by those who know him.</div>
                    <div><i>"I met Sander at a festival and sold him some drugs. After that I just kinda stuck around."</i></div>
                </div>
                <div class="column_image">
                    <img class="person_image" style='--image_width:{image_width};' src={coFounderImage} alt="co-founder" />
                </div>
            </div>
        {:else}
            <div class="column_text_mobile">
                <div><h3>Co-Founder: Sander `Kools</h3></div>
            </div>
            <div class="column_image_mobile">
                <img class="person_image_mobile" style='--image_width:{image_width};' src={coFounderImage} alt="co-founder" />
            </div>
            <div class="column_text_mobile">
                <div>Sander Kools is the co-founder and he was astronomical in helping found Zwaar Developers. His knowledge of modern business development and his unparalleled expertise in ideation synergy and market disruption to foster unprecedented innovation allowed the company to become what it is today. With a background in forward-thinking strategic alignment, his contributions are widely acknowledged by those who know him.</div>
                <br>
                <br>
                <div><i>"I met Sander at a festival and sold him some drugs. After that I just kinda stuck around."</i></div>
                <br>
                <br>
                <br>
            </div>
        {/if}

        {#if normalMode == true}
            <div class="row">
                <div class="column_image">
                    <img class="person_image" style='--image_width:{image_width};' src={CEOImage} alt="ceo" />
                </div>
                <div class="column_text">
                    <div><h3>CEO: Sander Kools</h3></div>
                    <div>At the helm of Zwaar Developers is Sander Kools, a visionary leader whose unyielding commitment to efficiency is matched only by his intense expression of joy and thrill when there are treats being handed out in the office. But beneath his rugged, and frankly very hairy, exterior lies a heart of pure ambition. Employees have learned that when Sander barks an order, it’s best not to question it. He understands the world that Zwaar Developers operates in and he's not afraid to sit and stay to wait for the perfect opportunity.<br>(It's the guy, not the dog)</div>
                    <div><i>"In business, you’ve got to keep your nose to the ground, your ears perked up, and always be ready to chase the next big opportunity."</i></div>
                </div>
            </div>
        {:else}
            <div class="column_text_mobile">
                <div><h3>CEO: Sander Kools</h3></div>
            </div>
            <div class="column_image_mobile">
                <img class="person_image_mobile" style='--image_width:{image_width};' src={CEOImage} alt="ceo" />
            </div>
            <div class="column_text_mobile">
                <div>At the helm of Zwaar Developers is Sander Kools, a visionary leader whose unyielding commitment to efficiency is matched only by his intense expression of joy and thrill when there are treats being handed out in the office. But beneath his rugged, and frankly very hairy, exterior lies a heart of pure ambition. Employees have learned that when Sander barks an order, it’s best not to question it. He understands the world that Zwaar Developers operates in and he's not afraid to sit and stay to wait for the perfect opportunity.<br>(It's the guy, not the dog)</div>
                <br>
                <br>
                <div><i>"In business, you’ve got to keep your nose to the ground, your ears perked up, and always be ready to chase the next big opportunity."</i></div>
                <br>
                <br>
                <br>
            </div>
        {/if}

        {#if normalMode == true}
            <div class="row">
                <div class="column_text">
                    <div><h3>CTO: Sander Kools</h3></div>
                    <div>At Zwaar Developers innovation purrs along smoothly under the watchful eye of Sander Kools, a technological genius with a penchant for sleek and agile solutions. He likes to silently observe from above, deciding whether or not a project deserves his time. But when he does show up, he walks over the keyboards of the employees giving insights that are as sharp as his claws. His unorthodox methods are best described by his relentless commitment of the clean desk policy. He will push off any cups or pens on the desks that are not adhering to this policy. His most successfull attribute is his admirable patience. Employees have learned that while the CTO may appear to be "offline", he's actually just in his cushy comfertable private office, waiting for the right time to show up<br>(It's the cat, not the guy)</div>
                    <div><i>"Meouw!"</i></div>
                </div>
                <div class="column_image">
                    <img class="person_image" style='--image_width:{image_width};' src={CTOImage} alt="cto" />
                </div>
            </div>
        {:else}
            <div class="column_text_mobile">
                <div><h3>CTO: Sander Kools</h3></div>
            </div>
            <div class="column_image_mobile">
                <img class="person_image_mobile" style='--image_width:{image_width};' src={CTOImage} alt="cto" />
            </div>
            <div class="column_text_mobile">
                <div>At Zwaar Developers innovation purrs along smoothly under the watchful eye of Sander Kools, a technological genius with a penchant for sleek and agile solutions. He likes to silently observe from above, deciding whether or not a project deserves his time. But when he does show up, he walks over the keyboards of the employees giving insights that are as sharp as his claws. His unorthodox methods are best described by his relentless commitment of the clean desk policy. He will push off any cups or pens on the desks that are not adhering to this policy. His most successfull attribute is his admirable patience. Employees have learned that while the CTO may appear to be "offline", he's actually just in his cushy comfertable private office, waiting for the right time to show up<br>(It's the cat, not the guy)</div>
                <br>
                <br>
                <div><i>"Meouw!"</i></div>
                <br>
                <br>
                <br>
            </div>
        {/if}

        {#if normalMode == true}
            <div class="row">
                <div class="column_image">
                    <img class="person_image" style='--image_width:{image_width};' src={CFOImage} alt="cfo" />
                </div>
                <div class="column_text">
                    <div><h3>CFO: Sander Kools</h3></div>
                    <div>At Zwaar Developers, fiscal responsibility is important. For that reason they hired Sander Kools for the job of CFO. He was already well known in the business, having worked at supermarkets, restaurants and even banks (just not in financial roles). His love for charts and graphs is on full display at every financial meeting and sometimes the graphs go up! His main inspiration in life is Mr. Krabs and it allows him to keep his focus on the most important thing in life: Money! Right now he is working on modernizing the company and introduce new crypto coins and NFT's, which will ensure the financial stability of Zwaar Developers in the digital future.</div>
                    <div><i>"Buy my new <strong>Zwaar</strong> coin! Line go up! To the moon!"</i></div>
                </div>
            </div>
        {:else}
            <div class="column_text_mobile">
                <div><h3>CFO: Sander Kools</h3></div>
            </div>
            <div class="column_imag_mobile">
                <img class="person_image_mobile" style='--image_width:{image_width};' src={CFOImage} alt="cfo" />
            </div>
            <div class="column_text_mobile">
                <div>At Zwaar Developers, fiscal responsibility is important. For that reason they hired Sander Kools for the job of CFO. He was already well known in the business, having worked at supermarkets, restaurants and even banks (just not in financial roles). His love for charts and graphs is on full display at every financial meeting and sometimes the graphs go up! His main inspiration in life is Mr. Krabs and it allows him to keep his focus on the most important thing in life: Money! Right now he is working on modernizing the company and introduce new crypto coins and NFT's, which will ensure the financial stability of Zwaar Developers in the digital future.</div>
                <br>
                <br>
                <div><i>"Buy my new <strong>Zwaar</strong> coin! Line go up! To the moon!"</i></div>
                <br>
                <br>
                <br>
            </div>
        {/if}

        {#if normalMode == true}
            <div class="row">
                <div class="column_text">
                    <div><h3>Content manager: Sander Kools</h3></div>
                    <div>Sander Kools was brought in at a time when it was difficult to manage all the content that Zwaar was putting out. All of this content was just pilling up and being un-managed. After he was brought in to fix this problem all the content was quickly managed.</div>
                    <div><i>"I love content! yum yum!"</i></div>
                </div>
                <div class="column_image">
                    <img class="person_image" style='--image_width:{image_width};' src={contentManagerImage} alt="content-manager" />
                </div>
            </div>
        {:else}
            <div class="column_text_mobile">
                <div><h3>Content manager: Sander Kools</h3></div>
            </div>
            <div class="column_image_mobile">
                <img class="person_image_mobile" style='--image_width:{image_width};' src={contentManagerImage} alt="content-manager" />
            </div>
            <div class="column_text_mobile">
                <div>Sander Kools was brought in at a time when it was difficult to manage all the content that Zwaar was putting out. All of this content was just pilling up and being un-managed. After he was brought in to fix this problem all the content was quickly managed.</div>
                <br>
                <br>
                <div><i>"I love content! yum yum!"</i></div>
                <br>
                <br>
                <br>
            </div>
        {/if}

        {#if normalMode == true}
            <div class="row">
                <div class="column_image">
                    <img class="person_image" style='--image_width:{image_width};' src={importExportImage} alt="content-manager" />
                </div>
                <div class="column_text">
                    <div><h3>Import/Export: Max</h3></div>
                    <div>One of the major issues that Zwaar faced was the ability to get items into the company and also to get items out of the company. For this astronomically difficult task they had to find the right person, which they did. After Max was brought in as Import/Export expert there have been no more issues with stuff going in or stuff going out!</div>
                    <div><i>"Few things in life are as eloquent or beautiful as Export. When I'm exporting I get chills and it makes me happy. There is only one thing I love more in life than Export and that is Import"</i></div>
                </div>
            </div>
        {:else}
            <div class="column_text_mobile">
                <div><h3>Import/Export: Max</h3></div>
            </div>
            <div class="column_image_mobile">
                <img class="person_image_mobile" style='--image_width:{image_width};' src={importExportImage} alt="content-manager" />
            </div>
            <div class="column_text_mobile">
                <div>One of the major issues that Zwaar faced was the ability to get items into the company and also to get items out of the company. For this astronomically difficult task they had to find the right person, which they did. After Max was brought in as Import/Export expert there have been no more issues with stuff going in or stuff going out!</div>
                <br>
                <br>
                <div><i>"Few things in life are as eloquent or beautiful as Export. When I'm exporting I get chills and it makes me happy. There is only one thing I love more in life than Export and that is Import"</i></div>
                <br>
                <br>
                <br>
            </div>
        {/if}


        {#if normalMode == true}
            <div class="row">
                <div class="column_text">
                    <div><h3>Human Resources Manager: Luc</h3></div>
                    <div>At Zwaar Developers, they wanted to create a negative workplace culture. For this they needed a truly awful Human Resources Manager, they found their perfect candidate in Luc. He always misses meetings and never responds to emails. If you have a situation and you go to talk to him all he does is nod enthusiastically while completely ignoring every concern brought to him. Need help with your benefits? Good luck getting him to explain them without pulling up a YouTube tutorial mid-meeting. Confused about company policies? Well, so is he. A decent HR department is essential for any large company, that is why Zwaar Developer will never truly get as big as it deserve to be.</div>
                    <div><i>"When it comes to Makro management, I believe in empowering employees to figure things out on their own. HR can’t do everything, right?"</i></div>
                </div>
                <div class="column_image">
                    <img class="person_image" style='--image_width:{image_width};' src={humanResourcesImage} alt="human-resources" />
                </div>
            </div>
        {:else}
            <div class="column_text_mobile">
                <div><h3>Human Resources Manager: Luc</h3></div>
            </div>
            <div class="column_image_mobile">
                <img class="person_image_mobile" style='--image_width:{image_width};' src={humanResourcesImage} alt="human-resources" />
            </div>
            <div class="column_text_mobile">
                <div>At Zwaar Developers, they wanted to create a negative workplace culture. For this they needed a truly awful Human Resources Manager, they found their perfect candidate in Luc. He always misses meetings and never responds to emails. If you have a situation and you go to talk to him all he does is nod enthusiastically while completely ignoring every concern brought to him. Need help with your benefits? Good luck getting him to explain them without pulling up a YouTube tutorial mid-meeting. Confused about company policies? Well, so is he. A decent HR department is essential for any large company, that is why Zwaar Developer will never truly get as big as it deserve to be.</div>
                <br>
                <br>
                <div><i>"When it comes to Makro management, I believe in empowering employees to figure things out on their own. HR can’t do everything, right?"</i></div>
                <br>
                <br>
                <br>
            </div>

        {/if}

        {#if normalMode == true}
            <div class="row">
                <div class="column_image">
                    <img class="person_image" style='--image_width:{image_width};' src={socialMediaManager} alt="sockal-media-manager" />
                </div>
                <div class="column_text">
                    <div><h3>Social Media Manager: Luc</h3></div>
                    <div>Zwaar Developers wouldn't exist if nobody used it products and services. That is where Luc comes in! In his role as Social Media Manager he is in charge of promoting new products and services that Zwaar Developers creates. He prefers a quality over quantity approach to his promotional campaings. When a new product is released he swiftly advertises it to all 5 of his Facebook friends.</div>
                    <div><i>"Have you seen this cool new app <strong>BroCast</strong>?"</i></div>
                </div>
            </div>
        {:else}
            <div class="column_text_mobile">
                <div><h3>Social Media Manager: Luc</h3></div>
            </div>
            <div class="column_image_mobile">
                <img class="person_image_mobile" style='--image_width:{image_width};' src={socialMediaManager} alt="sockal-media-manager" />
            </div>
            <div class="column_text_mobile">
                <div>Zwaar Developers wouldn't exist if nobody used it products and services. That is where Luc comes in! In his role as Social Media Manager he is in charge of promoting new products and services that Zwaar Developers creates. He prefers a quality over quantity approach to his promotional campaings. When a new product is released he swiftly advertises it to all 5 of his Facebook friends.</div>
                <br>
                <br>
                <div><i>"Have you seen this cool new app <strong>BroCast</strong>?"</i></div>
                <br>
                <br>
                <br>
            </div>
        {/if}

        <!-- Some spacing on the bottom -->
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
    </div>
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
    .person_image {
        height: 100%;
        width: 100%;
    }
    .person_image_mobile {
        height: 80%;
        width: 80%;
        margin-left: auto;
        margin-right: auto;
        display: block;
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
    .column_image_mobile {
        width: 100%;
        padding: 20px;
    }
    .column_text {
        float: left;
        width: 70%;
        display: grid;
        place-items: center;
        text-align: center;
        padding: 20px;
    }
    .column_text_mobile {
        width: 90%;
        text-align: center;
        margin-left: auto;
        margin-right: auto;
        display: block;
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