module TD.Data.InputPageBlock
  (InputPageBlock(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.RichText as RichText
import qualified Data.Text as T
import {-# SOURCE #-} qualified TD.Data.InputPageBlockListItem as InputPageBlockListItem
import qualified TD.Data.InputAnimation as InputAnimation
import qualified TD.Data.PageBlockCaption as PageBlockCaption
import qualified TD.Data.InputAudio as InputAudio
import qualified TD.Data.InputPhoto as InputPhoto
import qualified TD.Data.InputVideo as InputVideo
import qualified TD.Data.InputVoiceNote as InputVoiceNote
import qualified TD.Data.PageBlockTableCell as PageBlockTableCell
import qualified TD.Data.Location as Location

-- | Describes a block of a rich message to send
data InputPageBlock
  = InputPageBlockSectionHeading -- ^ A section heading
    { text :: Maybe RichText.RichText -- ^ Text of the section heading
    , size :: Maybe Int               -- ^ Relative size of the text font; 1-6, 1 is the largest, 6 is the smallest
    }
  | InputPageBlockParagraph -- ^ A text paragraph
    { text :: Maybe RichText.RichText -- ^ Paragraph text
    }
  | InputPageBlockPreformatted -- ^ A preformatted text paragraph
    { text     :: Maybe RichText.RichText -- ^ Paragraph text
    , language :: Maybe T.Text            -- ^ Programming language for which the text needs to be formatted
    }
  | InputPageBlockFooter -- ^ The footer of the page
    { footer :: Maybe RichText.RichText -- ^ Footer
    }
  | InputPageBlockThinking -- ^ A "Thinking..." placeholder; for pending rich messages only; for bots only
    { text :: Maybe RichText.RichText -- ^ Text of the placeholder
    }
  | InputPageBlockDivider -- ^ An empty block separating the page
  | InputPageBlockMathematicalExpression -- ^ A mathematical expression
    { expression :: Maybe T.Text -- ^ The expression in LaTeX format
    }
  | InputPageBlockAnchor -- ^ An invisible anchor
    { name :: Maybe T.Text -- ^ Name of the anchor
    }
  | InputPageBlockList -- ^ A list of data blocks
    { items :: Maybe [InputPageBlockListItem.InputPageBlockListItem] -- ^ The items of the list
    }
  | InputPageBlockBlockQuote -- ^ A block quote
    { blocks :: Maybe [InputPageBlock]  -- ^ Quote blocks
    , credit :: Maybe RichText.RichText -- ^ Quote credit; pass null if none
    }
  | InputPageBlockPullQuote -- ^ A pull quote
    { text   :: Maybe RichText.RichText -- ^ Quote text
    , credit :: Maybe RichText.RichText -- ^ Quote credit; pass null if none
    }
  | InputPageBlockAnimation -- ^ An animation
    { animation   :: Maybe InputAnimation.InputAnimation     -- ^ The animation to be sent
    , caption     :: Maybe PageBlockCaption.PageBlockCaption -- ^ Animation caption; pass null if none
    , has_spoiler :: Maybe Bool                              -- ^ True, if the animation preview must be covered by a spoiler animation
    }
  | InputPageBlockAudio -- ^ An audio file
    { audio   :: Maybe InputAudio.InputAudio             -- ^ The audio to be sent
    , caption :: Maybe PageBlockCaption.PageBlockCaption -- ^ Audio file caption; pass null if none
    }
  | InputPageBlockPhoto -- ^ A photo
    { photo       :: Maybe InputPhoto.InputPhoto             -- ^ The photo to be sent
    , caption     :: Maybe PageBlockCaption.PageBlockCaption -- ^ Photo caption; pass null if none
    , has_spoiler :: Maybe Bool                              -- ^ True, if the photo preview must be covered by a spoiler animation
    }
  | InputPageBlockVideo -- ^ A video
    { video       :: Maybe InputVideo.InputVideo             -- ^ The video to be sent
    , caption     :: Maybe PageBlockCaption.PageBlockCaption -- ^ Video caption; pass null if none
    , has_spoiler :: Maybe Bool                              -- ^ True, if the video preview must be covered by a spoiler animation
    }
  | InputPageBlockVoiceNote -- ^ A voice note
    { voice_note :: Maybe InputVoiceNote.InputVoiceNote     -- ^ The voice note to be sent
    , caption    :: Maybe PageBlockCaption.PageBlockCaption -- ^ Voice note caption; pass null if none
    }
  | InputPageBlockCollage -- ^ A collage
    { blocks  :: Maybe [InputPageBlock]                  -- ^ Collage item contents
    , caption :: Maybe PageBlockCaption.PageBlockCaption -- ^ Block caption; pass null if none
    }
  | InputPageBlockSlideshow -- ^ A slideshow
    { blocks  :: Maybe [InputPageBlock]                  -- ^ Slideshow item contents
    , caption :: Maybe PageBlockCaption.PageBlockCaption -- ^ Block caption; pass null if none
    }
  | InputPageBlockTable -- ^ A table
    { _caption    :: Maybe RichText.RichText                         -- ^ Table caption
    , cells       :: Maybe [[PageBlockTableCell.PageBlockTableCell]] -- ^ Table cells
    , is_bordered :: Maybe Bool                                      -- ^ True, if the table is bordered
    , is_striped  :: Maybe Bool                                      -- ^ True, if the table is striped
    }
  | InputPageBlockDetails -- ^ A collapsible block
    { header  :: Maybe RichText.RichText -- ^ Always visible heading for the block
    , blocks  :: Maybe [InputPageBlock]  -- ^ Block contents
    , is_open :: Maybe Bool              -- ^ True, if the block is open by default
    }
  | InputPageBlockMap -- ^ A map. The map's width and height must not exceed 10000 in total. Width and height ratio must be at most 20
    { location :: Maybe Location.Location                 -- ^ Location of the map center
    , zoom     :: Maybe Int                               -- ^ Map zoom level; 0-24
    , width    :: Maybe Int                               -- ^ Map width; 0-10000
    , height   :: Maybe Int                               -- ^ Map height; 0-10000
    , caption  :: Maybe PageBlockCaption.PageBlockCaption -- ^ Block caption; pass null if none
    }
  deriving (Eq, Show)

instance I.ShortShow InputPageBlock where
  shortShow InputPageBlockSectionHeading
    { text = text_
    , size = size_
    }
      = "InputPageBlockSectionHeading"
        ++ I.cc
        [ "text" `I.p` text_
        , "size" `I.p` size_
        ]
  shortShow InputPageBlockParagraph
    { text = text_
    }
      = "InputPageBlockParagraph"
        ++ I.cc
        [ "text" `I.p` text_
        ]
  shortShow InputPageBlockPreformatted
    { text     = text_
    , language = language_
    }
      = "InputPageBlockPreformatted"
        ++ I.cc
        [ "text"     `I.p` text_
        , "language" `I.p` language_
        ]
  shortShow InputPageBlockFooter
    { footer = footer_
    }
      = "InputPageBlockFooter"
        ++ I.cc
        [ "footer" `I.p` footer_
        ]
  shortShow InputPageBlockThinking
    { text = text_
    }
      = "InputPageBlockThinking"
        ++ I.cc
        [ "text" `I.p` text_
        ]
  shortShow InputPageBlockDivider
      = "InputPageBlockDivider"
  shortShow InputPageBlockMathematicalExpression
    { expression = expression_
    }
      = "InputPageBlockMathematicalExpression"
        ++ I.cc
        [ "expression" `I.p` expression_
        ]
  shortShow InputPageBlockAnchor
    { name = name_
    }
      = "InputPageBlockAnchor"
        ++ I.cc
        [ "name" `I.p` name_
        ]
  shortShow InputPageBlockList
    { items = items_
    }
      = "InputPageBlockList"
        ++ I.cc
        [ "items" `I.p` items_
        ]
  shortShow InputPageBlockBlockQuote
    { blocks = blocks_
    , credit = credit_
    }
      = "InputPageBlockBlockQuote"
        ++ I.cc
        [ "blocks" `I.p` blocks_
        , "credit" `I.p` credit_
        ]
  shortShow InputPageBlockPullQuote
    { text   = text_
    , credit = credit_
    }
      = "InputPageBlockPullQuote"
        ++ I.cc
        [ "text"   `I.p` text_
        , "credit" `I.p` credit_
        ]
  shortShow InputPageBlockAnimation
    { animation   = animation_
    , caption     = caption_
    , has_spoiler = has_spoiler_
    }
      = "InputPageBlockAnimation"
        ++ I.cc
        [ "animation"   `I.p` animation_
        , "caption"     `I.p` caption_
        , "has_spoiler" `I.p` has_spoiler_
        ]
  shortShow InputPageBlockAudio
    { audio   = audio_
    , caption = caption_
    }
      = "InputPageBlockAudio"
        ++ I.cc
        [ "audio"   `I.p` audio_
        , "caption" `I.p` caption_
        ]
  shortShow InputPageBlockPhoto
    { photo       = photo_
    , caption     = caption_
    , has_spoiler = has_spoiler_
    }
      = "InputPageBlockPhoto"
        ++ I.cc
        [ "photo"       `I.p` photo_
        , "caption"     `I.p` caption_
        , "has_spoiler" `I.p` has_spoiler_
        ]
  shortShow InputPageBlockVideo
    { video       = video_
    , caption     = caption_
    , has_spoiler = has_spoiler_
    }
      = "InputPageBlockVideo"
        ++ I.cc
        [ "video"       `I.p` video_
        , "caption"     `I.p` caption_
        , "has_spoiler" `I.p` has_spoiler_
        ]
  shortShow InputPageBlockVoiceNote
    { voice_note = voice_note_
    , caption    = caption_
    }
      = "InputPageBlockVoiceNote"
        ++ I.cc
        [ "voice_note" `I.p` voice_note_
        , "caption"    `I.p` caption_
        ]
  shortShow InputPageBlockCollage
    { blocks  = blocks_
    , caption = caption_
    }
      = "InputPageBlockCollage"
        ++ I.cc
        [ "blocks"  `I.p` blocks_
        , "caption" `I.p` caption_
        ]
  shortShow InputPageBlockSlideshow
    { blocks  = blocks_
    , caption = caption_
    }
      = "InputPageBlockSlideshow"
        ++ I.cc
        [ "blocks"  `I.p` blocks_
        , "caption" `I.p` caption_
        ]
  shortShow InputPageBlockTable
    { _caption    = _caption_
    , cells       = cells_
    , is_bordered = is_bordered_
    , is_striped  = is_striped_
    }
      = "InputPageBlockTable"
        ++ I.cc
        [ "_caption"    `I.p` _caption_
        , "cells"       `I.p` cells_
        , "is_bordered" `I.p` is_bordered_
        , "is_striped"  `I.p` is_striped_
        ]
  shortShow InputPageBlockDetails
    { header  = header_
    , blocks  = blocks_
    , is_open = is_open_
    }
      = "InputPageBlockDetails"
        ++ I.cc
        [ "header"  `I.p` header_
        , "blocks"  `I.p` blocks_
        , "is_open" `I.p` is_open_
        ]
  shortShow InputPageBlockMap
    { location = location_
    , zoom     = zoom_
    , width    = width_
    , height   = height_
    , caption  = caption_
    }
      = "InputPageBlockMap"
        ++ I.cc
        [ "location" `I.p` location_
        , "zoom"     `I.p` zoom_
        , "width"    `I.p` width_
        , "height"   `I.p` height_
        , "caption"  `I.p` caption_
        ]

instance AT.FromJSON InputPageBlock where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputPageBlockSectionHeading"         -> parseInputPageBlockSectionHeading v
      "inputPageBlockParagraph"              -> parseInputPageBlockParagraph v
      "inputPageBlockPreformatted"           -> parseInputPageBlockPreformatted v
      "inputPageBlockFooter"                 -> parseInputPageBlockFooter v
      "inputPageBlockThinking"               -> parseInputPageBlockThinking v
      "inputPageBlockDivider"                -> pure InputPageBlockDivider
      "inputPageBlockMathematicalExpression" -> parseInputPageBlockMathematicalExpression v
      "inputPageBlockAnchor"                 -> parseInputPageBlockAnchor v
      "inputPageBlockList"                   -> parseInputPageBlockList v
      "inputPageBlockBlockQuote"             -> parseInputPageBlockBlockQuote v
      "inputPageBlockPullQuote"              -> parseInputPageBlockPullQuote v
      "inputPageBlockAnimation"              -> parseInputPageBlockAnimation v
      "inputPageBlockAudio"                  -> parseInputPageBlockAudio v
      "inputPageBlockPhoto"                  -> parseInputPageBlockPhoto v
      "inputPageBlockVideo"                  -> parseInputPageBlockVideo v
      "inputPageBlockVoiceNote"              -> parseInputPageBlockVoiceNote v
      "inputPageBlockCollage"                -> parseInputPageBlockCollage v
      "inputPageBlockSlideshow"              -> parseInputPageBlockSlideshow v
      "inputPageBlockTable"                  -> parseInputPageBlockTable v
      "inputPageBlockDetails"                -> parseInputPageBlockDetails v
      "inputPageBlockMap"                    -> parseInputPageBlockMap v
      _                                      -> mempty
    
    where
      parseInputPageBlockSectionHeading :: A.Value -> AT.Parser InputPageBlock
      parseInputPageBlockSectionHeading = A.withObject "InputPageBlockSectionHeading" $ \o -> do
        text_ <- o A..:?  "text"
        size_ <- o A..:?  "size"
        pure $ InputPageBlockSectionHeading
          { text = text_
          , size = size_
          }
      parseInputPageBlockParagraph :: A.Value -> AT.Parser InputPageBlock
      parseInputPageBlockParagraph = A.withObject "InputPageBlockParagraph" $ \o -> do
        text_ <- o A..:?  "text"
        pure $ InputPageBlockParagraph
          { text = text_
          }
      parseInputPageBlockPreformatted :: A.Value -> AT.Parser InputPageBlock
      parseInputPageBlockPreformatted = A.withObject "InputPageBlockPreformatted" $ \o -> do
        text_     <- o A..:?  "text"
        language_ <- o A..:?  "language"
        pure $ InputPageBlockPreformatted
          { text     = text_
          , language = language_
          }
      parseInputPageBlockFooter :: A.Value -> AT.Parser InputPageBlock
      parseInputPageBlockFooter = A.withObject "InputPageBlockFooter" $ \o -> do
        footer_ <- o A..:?  "footer"
        pure $ InputPageBlockFooter
          { footer = footer_
          }
      parseInputPageBlockThinking :: A.Value -> AT.Parser InputPageBlock
      parseInputPageBlockThinking = A.withObject "InputPageBlockThinking" $ \o -> do
        text_ <- o A..:?  "text"
        pure $ InputPageBlockThinking
          { text = text_
          }
      parseInputPageBlockMathematicalExpression :: A.Value -> AT.Parser InputPageBlock
      parseInputPageBlockMathematicalExpression = A.withObject "InputPageBlockMathematicalExpression" $ \o -> do
        expression_ <- o A..:?  "expression"
        pure $ InputPageBlockMathematicalExpression
          { expression = expression_
          }
      parseInputPageBlockAnchor :: A.Value -> AT.Parser InputPageBlock
      parseInputPageBlockAnchor = A.withObject "InputPageBlockAnchor" $ \o -> do
        name_ <- o A..:?  "name"
        pure $ InputPageBlockAnchor
          { name = name_
          }
      parseInputPageBlockList :: A.Value -> AT.Parser InputPageBlock
      parseInputPageBlockList = A.withObject "InputPageBlockList" $ \o -> do
        items_ <- o A..:?  "items"
        pure $ InputPageBlockList
          { items = items_
          }
      parseInputPageBlockBlockQuote :: A.Value -> AT.Parser InputPageBlock
      parseInputPageBlockBlockQuote = A.withObject "InputPageBlockBlockQuote" $ \o -> do
        blocks_ <- o A..:?  "blocks"
        credit_ <- o A..:?  "credit"
        pure $ InputPageBlockBlockQuote
          { blocks = blocks_
          , credit = credit_
          }
      parseInputPageBlockPullQuote :: A.Value -> AT.Parser InputPageBlock
      parseInputPageBlockPullQuote = A.withObject "InputPageBlockPullQuote" $ \o -> do
        text_   <- o A..:?  "text"
        credit_ <- o A..:?  "credit"
        pure $ InputPageBlockPullQuote
          { text   = text_
          , credit = credit_
          }
      parseInputPageBlockAnimation :: A.Value -> AT.Parser InputPageBlock
      parseInputPageBlockAnimation = A.withObject "InputPageBlockAnimation" $ \o -> do
        animation_   <- o A..:?  "animation"
        caption_     <- o A..:?  "caption"
        has_spoiler_ <- o A..:?  "has_spoiler"
        pure $ InputPageBlockAnimation
          { animation   = animation_
          , caption     = caption_
          , has_spoiler = has_spoiler_
          }
      parseInputPageBlockAudio :: A.Value -> AT.Parser InputPageBlock
      parseInputPageBlockAudio = A.withObject "InputPageBlockAudio" $ \o -> do
        audio_   <- o A..:?  "audio"
        caption_ <- o A..:?  "caption"
        pure $ InputPageBlockAudio
          { audio   = audio_
          , caption = caption_
          }
      parseInputPageBlockPhoto :: A.Value -> AT.Parser InputPageBlock
      parseInputPageBlockPhoto = A.withObject "InputPageBlockPhoto" $ \o -> do
        photo_       <- o A..:?  "photo"
        caption_     <- o A..:?  "caption"
        has_spoiler_ <- o A..:?  "has_spoiler"
        pure $ InputPageBlockPhoto
          { photo       = photo_
          , caption     = caption_
          , has_spoiler = has_spoiler_
          }
      parseInputPageBlockVideo :: A.Value -> AT.Parser InputPageBlock
      parseInputPageBlockVideo = A.withObject "InputPageBlockVideo" $ \o -> do
        video_       <- o A..:?  "video"
        caption_     <- o A..:?  "caption"
        has_spoiler_ <- o A..:?  "has_spoiler"
        pure $ InputPageBlockVideo
          { video       = video_
          , caption     = caption_
          , has_spoiler = has_spoiler_
          }
      parseInputPageBlockVoiceNote :: A.Value -> AT.Parser InputPageBlock
      parseInputPageBlockVoiceNote = A.withObject "InputPageBlockVoiceNote" $ \o -> do
        voice_note_ <- o A..:?  "voice_note"
        caption_    <- o A..:?  "caption"
        pure $ InputPageBlockVoiceNote
          { voice_note = voice_note_
          , caption    = caption_
          }
      parseInputPageBlockCollage :: A.Value -> AT.Parser InputPageBlock
      parseInputPageBlockCollage = A.withObject "InputPageBlockCollage" $ \o -> do
        blocks_  <- o A..:?  "blocks"
        caption_ <- o A..:?  "caption"
        pure $ InputPageBlockCollage
          { blocks  = blocks_
          , caption = caption_
          }
      parseInputPageBlockSlideshow :: A.Value -> AT.Parser InputPageBlock
      parseInputPageBlockSlideshow = A.withObject "InputPageBlockSlideshow" $ \o -> do
        blocks_  <- o A..:?  "blocks"
        caption_ <- o A..:?  "caption"
        pure $ InputPageBlockSlideshow
          { blocks  = blocks_
          , caption = caption_
          }
      parseInputPageBlockTable :: A.Value -> AT.Parser InputPageBlock
      parseInputPageBlockTable = A.withObject "InputPageBlockTable" $ \o -> do
        _caption_    <- o A..:?  "caption"
        cells_       <- o A..:?  "cells"
        is_bordered_ <- o A..:?  "is_bordered"
        is_striped_  <- o A..:?  "is_striped"
        pure $ InputPageBlockTable
          { _caption    = _caption_
          , cells       = cells_
          , is_bordered = is_bordered_
          , is_striped  = is_striped_
          }
      parseInputPageBlockDetails :: A.Value -> AT.Parser InputPageBlock
      parseInputPageBlockDetails = A.withObject "InputPageBlockDetails" $ \o -> do
        header_  <- o A..:?  "header"
        blocks_  <- o A..:?  "blocks"
        is_open_ <- o A..:?  "is_open"
        pure $ InputPageBlockDetails
          { header  = header_
          , blocks  = blocks_
          , is_open = is_open_
          }
      parseInputPageBlockMap :: A.Value -> AT.Parser InputPageBlock
      parseInputPageBlockMap = A.withObject "InputPageBlockMap" $ \o -> do
        location_ <- o A..:?  "location"
        zoom_     <- o A..:?  "zoom"
        width_    <- o A..:?  "width"
        height_   <- o A..:?  "height"
        caption_  <- o A..:?  "caption"
        pure $ InputPageBlockMap
          { location = location_
          , zoom     = zoom_
          , width    = width_
          , height   = height_
          , caption  = caption_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputPageBlock where
  toJSON InputPageBlockSectionHeading
    { text = text_
    , size = size_
    }
      = A.object
        [ "@type" A..= AT.String "inputPageBlockSectionHeading"
        , "text"  A..= text_
        , "size"  A..= size_
        ]
  toJSON InputPageBlockParagraph
    { text = text_
    }
      = A.object
        [ "@type" A..= AT.String "inputPageBlockParagraph"
        , "text"  A..= text_
        ]
  toJSON InputPageBlockPreformatted
    { text     = text_
    , language = language_
    }
      = A.object
        [ "@type"    A..= AT.String "inputPageBlockPreformatted"
        , "text"     A..= text_
        , "language" A..= language_
        ]
  toJSON InputPageBlockFooter
    { footer = footer_
    }
      = A.object
        [ "@type"  A..= AT.String "inputPageBlockFooter"
        , "footer" A..= footer_
        ]
  toJSON InputPageBlockThinking
    { text = text_
    }
      = A.object
        [ "@type" A..= AT.String "inputPageBlockThinking"
        , "text"  A..= text_
        ]
  toJSON InputPageBlockDivider
      = A.object
        [ "@type" A..= AT.String "inputPageBlockDivider"
        ]
  toJSON InputPageBlockMathematicalExpression
    { expression = expression_
    }
      = A.object
        [ "@type"      A..= AT.String "inputPageBlockMathematicalExpression"
        , "expression" A..= expression_
        ]
  toJSON InputPageBlockAnchor
    { name = name_
    }
      = A.object
        [ "@type" A..= AT.String "inputPageBlockAnchor"
        , "name"  A..= name_
        ]
  toJSON InputPageBlockList
    { items = items_
    }
      = A.object
        [ "@type" A..= AT.String "inputPageBlockList"
        , "items" A..= items_
        ]
  toJSON InputPageBlockBlockQuote
    { blocks = blocks_
    , credit = credit_
    }
      = A.object
        [ "@type"  A..= AT.String "inputPageBlockBlockQuote"
        , "blocks" A..= blocks_
        , "credit" A..= credit_
        ]
  toJSON InputPageBlockPullQuote
    { text   = text_
    , credit = credit_
    }
      = A.object
        [ "@type"  A..= AT.String "inputPageBlockPullQuote"
        , "text"   A..= text_
        , "credit" A..= credit_
        ]
  toJSON InputPageBlockAnimation
    { animation   = animation_
    , caption     = caption_
    , has_spoiler = has_spoiler_
    }
      = A.object
        [ "@type"       A..= AT.String "inputPageBlockAnimation"
        , "animation"   A..= animation_
        , "caption"     A..= caption_
        , "has_spoiler" A..= has_spoiler_
        ]
  toJSON InputPageBlockAudio
    { audio   = audio_
    , caption = caption_
    }
      = A.object
        [ "@type"   A..= AT.String "inputPageBlockAudio"
        , "audio"   A..= audio_
        , "caption" A..= caption_
        ]
  toJSON InputPageBlockPhoto
    { photo       = photo_
    , caption     = caption_
    , has_spoiler = has_spoiler_
    }
      = A.object
        [ "@type"       A..= AT.String "inputPageBlockPhoto"
        , "photo"       A..= photo_
        , "caption"     A..= caption_
        , "has_spoiler" A..= has_spoiler_
        ]
  toJSON InputPageBlockVideo
    { video       = video_
    , caption     = caption_
    , has_spoiler = has_spoiler_
    }
      = A.object
        [ "@type"       A..= AT.String "inputPageBlockVideo"
        , "video"       A..= video_
        , "caption"     A..= caption_
        , "has_spoiler" A..= has_spoiler_
        ]
  toJSON InputPageBlockVoiceNote
    { voice_note = voice_note_
    , caption    = caption_
    }
      = A.object
        [ "@type"      A..= AT.String "inputPageBlockVoiceNote"
        , "voice_note" A..= voice_note_
        , "caption"    A..= caption_
        ]
  toJSON InputPageBlockCollage
    { blocks  = blocks_
    , caption = caption_
    }
      = A.object
        [ "@type"   A..= AT.String "inputPageBlockCollage"
        , "blocks"  A..= blocks_
        , "caption" A..= caption_
        ]
  toJSON InputPageBlockSlideshow
    { blocks  = blocks_
    , caption = caption_
    }
      = A.object
        [ "@type"   A..= AT.String "inputPageBlockSlideshow"
        , "blocks"  A..= blocks_
        , "caption" A..= caption_
        ]
  toJSON InputPageBlockTable
    { _caption    = _caption_
    , cells       = cells_
    , is_bordered = is_bordered_
    , is_striped  = is_striped_
    }
      = A.object
        [ "@type"       A..= AT.String "inputPageBlockTable"
        , "caption"     A..= _caption_
        , "cells"       A..= cells_
        , "is_bordered" A..= is_bordered_
        , "is_striped"  A..= is_striped_
        ]
  toJSON InputPageBlockDetails
    { header  = header_
    , blocks  = blocks_
    , is_open = is_open_
    }
      = A.object
        [ "@type"   A..= AT.String "inputPageBlockDetails"
        , "header"  A..= header_
        , "blocks"  A..= blocks_
        , "is_open" A..= is_open_
        ]
  toJSON InputPageBlockMap
    { location = location_
    , zoom     = zoom_
    , width    = width_
    , height   = height_
    , caption  = caption_
    }
      = A.object
        [ "@type"    A..= AT.String "inputPageBlockMap"
        , "location" A..= location_
        , "zoom"     A..= zoom_
        , "width"    A..= width_
        , "height"   A..= height_
        , "caption"  A..= caption_
        ]

