module TD.Data.RichText
  (RichText(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Document as Document

-- | Describes a formatted text object
data RichText
  = RichTextPlain -- ^ A plain text
    { text :: Maybe T.Text -- ^ Text
    }
  | RichTextBold -- ^ A bold rich text
    { _text :: Maybe RichText -- ^ Text
    }
  | RichTextItalic -- ^ An italicized rich text
    { _text :: Maybe RichText -- ^ Text
    }
  | RichTextUnderline -- ^ An underlined rich text
    { _text :: Maybe RichText -- ^ Text
    }
  | RichTextStrikethrough -- ^ A strikethrough rich text
    { _text :: Maybe RichText -- ^ Text
    }
  | RichTextFixed -- ^ A fixed-width rich text
    { _text :: Maybe RichText -- ^ Text
    }
  | RichTextUrl -- ^ A rich text URL link
    { _text     :: Maybe RichText -- ^ Text
    , url       :: Maybe T.Text   -- ^ URL
    , is_cached :: Maybe Bool     -- ^ True, if the URL has cached instant view server-side
    }
  | RichTextEmailAddress -- ^ A rich text email link
    { _text         :: Maybe RichText -- ^ Text
    , email_address :: Maybe T.Text   -- ^ Email address
    }
  | RichTextSubscript -- ^ A subscript rich text
    { _text :: Maybe RichText -- ^ Text
    }
  | RichTextSuperscript -- ^ A superscript rich text
    { _text :: Maybe RichText -- ^ Text
    }
  | RichTextMarked -- ^ A marked rich text
    { _text :: Maybe RichText -- ^ Text
    }
  | RichTextPhoneNumber -- ^ A rich text phone number
    { _text        :: Maybe RichText -- ^ Text
    , phone_number :: Maybe T.Text   -- ^ Phone number
    }
  | RichTextIcon -- ^ A small image inside the text
    { document :: Maybe Document.Document -- ^ The image represented as a document. The image can be in GIF, JPEG or PNG format
    , width    :: Maybe Int               -- ^ Width of a bounding box in which the image must be shown; 0 if unknown
    , height   :: Maybe Int               -- ^ Height of a bounding box in which the image must be shown; 0 if unknown
    }
  | RichTextReference -- ^ A reference to a richTexts object on the same page
    { _text       :: Maybe RichText -- ^ The text
    , anchor_name :: Maybe T.Text   -- ^ The name of a richTextAnchor object, which is the first element of the target richTexts object
    , url         :: Maybe T.Text   -- ^ An HTTP URL, opening the reference
    }
  | RichTextAnchor -- ^ An anchor
    { name :: Maybe T.Text -- ^ Anchor name
    }
  | RichTextAnchorLink -- ^ A link to an anchor on the same page
    { _text       :: Maybe RichText -- ^ The link text
    , anchor_name :: Maybe T.Text   -- ^ The anchor name. If the name is empty, the link must bring back to top
    , url         :: Maybe T.Text   -- ^ An HTTP URL, opening the anchor
    }
  | RichTexts -- ^ A concatenation of rich texts
    { texts :: Maybe [RichText] -- ^ Texts
    }
  deriving (Eq, Show)

instance I.ShortShow RichText where
  shortShow RichTextPlain
    { text = text_
    }
      = "RichTextPlain"
        ++ I.cc
        [ "text" `I.p` text_
        ]
  shortShow RichTextBold
    { _text = _text_
    }
      = "RichTextBold"
        ++ I.cc
        [ "_text" `I.p` _text_
        ]
  shortShow RichTextItalic
    { _text = _text_
    }
      = "RichTextItalic"
        ++ I.cc
        [ "_text" `I.p` _text_
        ]
  shortShow RichTextUnderline
    { _text = _text_
    }
      = "RichTextUnderline"
        ++ I.cc
        [ "_text" `I.p` _text_
        ]
  shortShow RichTextStrikethrough
    { _text = _text_
    }
      = "RichTextStrikethrough"
        ++ I.cc
        [ "_text" `I.p` _text_
        ]
  shortShow RichTextFixed
    { _text = _text_
    }
      = "RichTextFixed"
        ++ I.cc
        [ "_text" `I.p` _text_
        ]
  shortShow RichTextUrl
    { _text     = _text_
    , url       = url_
    , is_cached = is_cached_
    }
      = "RichTextUrl"
        ++ I.cc
        [ "_text"     `I.p` _text_
        , "url"       `I.p` url_
        , "is_cached" `I.p` is_cached_
        ]
  shortShow RichTextEmailAddress
    { _text         = _text_
    , email_address = email_address_
    }
      = "RichTextEmailAddress"
        ++ I.cc
        [ "_text"         `I.p` _text_
        , "email_address" `I.p` email_address_
        ]
  shortShow RichTextSubscript
    { _text = _text_
    }
      = "RichTextSubscript"
        ++ I.cc
        [ "_text" `I.p` _text_
        ]
  shortShow RichTextSuperscript
    { _text = _text_
    }
      = "RichTextSuperscript"
        ++ I.cc
        [ "_text" `I.p` _text_
        ]
  shortShow RichTextMarked
    { _text = _text_
    }
      = "RichTextMarked"
        ++ I.cc
        [ "_text" `I.p` _text_
        ]
  shortShow RichTextPhoneNumber
    { _text        = _text_
    , phone_number = phone_number_
    }
      = "RichTextPhoneNumber"
        ++ I.cc
        [ "_text"        `I.p` _text_
        , "phone_number" `I.p` phone_number_
        ]
  shortShow RichTextIcon
    { document = document_
    , width    = width_
    , height   = height_
    }
      = "RichTextIcon"
        ++ I.cc
        [ "document" `I.p` document_
        , "width"    `I.p` width_
        , "height"   `I.p` height_
        ]
  shortShow RichTextReference
    { _text       = _text_
    , anchor_name = anchor_name_
    , url         = url_
    }
      = "RichTextReference"
        ++ I.cc
        [ "_text"       `I.p` _text_
        , "anchor_name" `I.p` anchor_name_
        , "url"         `I.p` url_
        ]
  shortShow RichTextAnchor
    { name = name_
    }
      = "RichTextAnchor"
        ++ I.cc
        [ "name" `I.p` name_
        ]
  shortShow RichTextAnchorLink
    { _text       = _text_
    , anchor_name = anchor_name_
    , url         = url_
    }
      = "RichTextAnchorLink"
        ++ I.cc
        [ "_text"       `I.p` _text_
        , "anchor_name" `I.p` anchor_name_
        , "url"         `I.p` url_
        ]
  shortShow RichTexts
    { texts = texts_
    }
      = "RichTexts"
        ++ I.cc
        [ "texts" `I.p` texts_
        ]

instance AT.FromJSON RichText where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "richTextPlain"         -> parseRichTextPlain v
      "richTextBold"          -> parseRichTextBold v
      "richTextItalic"        -> parseRichTextItalic v
      "richTextUnderline"     -> parseRichTextUnderline v
      "richTextStrikethrough" -> parseRichTextStrikethrough v
      "richTextFixed"         -> parseRichTextFixed v
      "richTextUrl"           -> parseRichTextUrl v
      "richTextEmailAddress"  -> parseRichTextEmailAddress v
      "richTextSubscript"     -> parseRichTextSubscript v
      "richTextSuperscript"   -> parseRichTextSuperscript v
      "richTextMarked"        -> parseRichTextMarked v
      "richTextPhoneNumber"   -> parseRichTextPhoneNumber v
      "richTextIcon"          -> parseRichTextIcon v
      "richTextReference"     -> parseRichTextReference v
      "richTextAnchor"        -> parseRichTextAnchor v
      "richTextAnchorLink"    -> parseRichTextAnchorLink v
      "richTexts"             -> parseRichTexts v
      _                       -> mempty
    
    where
      parseRichTextPlain :: A.Value -> AT.Parser RichText
      parseRichTextPlain = A.withObject "RichTextPlain" $ \o -> do
        text_ <- o A..:?  "text"
        pure $ RichTextPlain
          { text = text_
          }
      parseRichTextBold :: A.Value -> AT.Parser RichText
      parseRichTextBold = A.withObject "RichTextBold" $ \o -> do
        _text_ <- o A..:?  "text"
        pure $ RichTextBold
          { _text = _text_
          }
      parseRichTextItalic :: A.Value -> AT.Parser RichText
      parseRichTextItalic = A.withObject "RichTextItalic" $ \o -> do
        _text_ <- o A..:?  "text"
        pure $ RichTextItalic
          { _text = _text_
          }
      parseRichTextUnderline :: A.Value -> AT.Parser RichText
      parseRichTextUnderline = A.withObject "RichTextUnderline" $ \o -> do
        _text_ <- o A..:?  "text"
        pure $ RichTextUnderline
          { _text = _text_
          }
      parseRichTextStrikethrough :: A.Value -> AT.Parser RichText
      parseRichTextStrikethrough = A.withObject "RichTextStrikethrough" $ \o -> do
        _text_ <- o A..:?  "text"
        pure $ RichTextStrikethrough
          { _text = _text_
          }
      parseRichTextFixed :: A.Value -> AT.Parser RichText
      parseRichTextFixed = A.withObject "RichTextFixed" $ \o -> do
        _text_ <- o A..:?  "text"
        pure $ RichTextFixed
          { _text = _text_
          }
      parseRichTextUrl :: A.Value -> AT.Parser RichText
      parseRichTextUrl = A.withObject "RichTextUrl" $ \o -> do
        _text_     <- o A..:?  "text"
        url_       <- o A..:?  "url"
        is_cached_ <- o A..:?  "is_cached"
        pure $ RichTextUrl
          { _text     = _text_
          , url       = url_
          , is_cached = is_cached_
          }
      parseRichTextEmailAddress :: A.Value -> AT.Parser RichText
      parseRichTextEmailAddress = A.withObject "RichTextEmailAddress" $ \o -> do
        _text_         <- o A..:?  "text"
        email_address_ <- o A..:?  "email_address"
        pure $ RichTextEmailAddress
          { _text         = _text_
          , email_address = email_address_
          }
      parseRichTextSubscript :: A.Value -> AT.Parser RichText
      parseRichTextSubscript = A.withObject "RichTextSubscript" $ \o -> do
        _text_ <- o A..:?  "text"
        pure $ RichTextSubscript
          { _text = _text_
          }
      parseRichTextSuperscript :: A.Value -> AT.Parser RichText
      parseRichTextSuperscript = A.withObject "RichTextSuperscript" $ \o -> do
        _text_ <- o A..:?  "text"
        pure $ RichTextSuperscript
          { _text = _text_
          }
      parseRichTextMarked :: A.Value -> AT.Parser RichText
      parseRichTextMarked = A.withObject "RichTextMarked" $ \o -> do
        _text_ <- o A..:?  "text"
        pure $ RichTextMarked
          { _text = _text_
          }
      parseRichTextPhoneNumber :: A.Value -> AT.Parser RichText
      parseRichTextPhoneNumber = A.withObject "RichTextPhoneNumber" $ \o -> do
        _text_        <- o A..:?  "text"
        phone_number_ <- o A..:?  "phone_number"
        pure $ RichTextPhoneNumber
          { _text        = _text_
          , phone_number = phone_number_
          }
      parseRichTextIcon :: A.Value -> AT.Parser RichText
      parseRichTextIcon = A.withObject "RichTextIcon" $ \o -> do
        document_ <- o A..:?  "document"
        width_    <- o A..:?  "width"
        height_   <- o A..:?  "height"
        pure $ RichTextIcon
          { document = document_
          , width    = width_
          , height   = height_
          }
      parseRichTextReference :: A.Value -> AT.Parser RichText
      parseRichTextReference = A.withObject "RichTextReference" $ \o -> do
        _text_       <- o A..:?  "text"
        anchor_name_ <- o A..:?  "anchor_name"
        url_         <- o A..:?  "url"
        pure $ RichTextReference
          { _text       = _text_
          , anchor_name = anchor_name_
          , url         = url_
          }
      parseRichTextAnchor :: A.Value -> AT.Parser RichText
      parseRichTextAnchor = A.withObject "RichTextAnchor" $ \o -> do
        name_ <- o A..:?  "name"
        pure $ RichTextAnchor
          { name = name_
          }
      parseRichTextAnchorLink :: A.Value -> AT.Parser RichText
      parseRichTextAnchorLink = A.withObject "RichTextAnchorLink" $ \o -> do
        _text_       <- o A..:?  "text"
        anchor_name_ <- o A..:?  "anchor_name"
        url_         <- o A..:?  "url"
        pure $ RichTextAnchorLink
          { _text       = _text_
          , anchor_name = anchor_name_
          , url         = url_
          }
      parseRichTexts :: A.Value -> AT.Parser RichText
      parseRichTexts = A.withObject "RichTexts" $ \o -> do
        texts_ <- o A..:?  "texts"
        pure $ RichTexts
          { texts = texts_
          }
  parseJSON _ = mempty

