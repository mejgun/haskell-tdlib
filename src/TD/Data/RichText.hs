{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.RichText where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Document as Document
import qualified Utils as U

-- | Describes a text object inside an instant-view web page
data RichText
  = -- | A plain text @text Text
    RichTextPlain
      { -- |
        text :: Maybe String
      }
  | -- | A bold rich text @text Text
    RichTextBold
      { -- |
        _text :: Maybe RichText
      }
  | -- | An italicized rich text @text Text
    RichTextItalic
      { -- |
        _text :: Maybe RichText
      }
  | -- | An underlined rich text @text Text
    RichTextUnderline
      { -- |
        _text :: Maybe RichText
      }
  | -- | A strikethrough rich text @text Text
    RichTextStrikethrough
      { -- |
        _text :: Maybe RichText
      }
  | -- | A fixed-width rich text @text Text
    RichTextFixed
      { -- |
        _text :: Maybe RichText
      }
  | -- | A rich text URL link @text Text @url URL @is_cached True, if the URL has cached instant view server-side
    RichTextUrl
      { -- |
        is_cached :: Maybe Bool,
        -- |
        url :: Maybe String,
        -- |
        _text :: Maybe RichText
      }
  | -- | A rich text email link @text Text @email_address Email address
    RichTextEmailAddress
      { -- |
        email_address :: Maybe String,
        -- |
        _text :: Maybe RichText
      }
  | -- | A subscript rich text @text Text
    RichTextSubscript
      { -- |
        _text :: Maybe RichText
      }
  | -- | A superscript rich text @text Text
    RichTextSuperscript
      { -- |
        _text :: Maybe RichText
      }
  | -- | A marked rich text @text Text
    RichTextMarked
      { -- |
        _text :: Maybe RichText
      }
  | -- | A rich text phone number @text Text @phone_number Phone number
    RichTextPhoneNumber
      { -- |
        phone_number :: Maybe String,
        -- |
        _text :: Maybe RichText
      }
  | -- | A small image inside the text
    RichTextIcon
      { -- | Height of a bounding box in which the image must be shown; 0 if unknown
        height :: Maybe Int,
        -- | Width of a bounding box in which the image must be shown; 0 if unknown
        width :: Maybe Int,
        -- | The image represented as a document. The image can be in GIF, JPEG or PNG format
        document :: Maybe Document.Document
      }
  | -- | A reference to a richTexts object on the same web page @text The text @anchor_name The name of a richTextAnchor object, which is the first element of the target richTexts object @url An HTTP URL, opening the reference
    RichTextReference
      { -- |
        url :: Maybe String,
        -- |
        anchor_name :: Maybe String,
        -- |
        _text :: Maybe RichText
      }
  | -- | An anchor @name Anchor name
    RichTextAnchor
      { -- |
        name :: Maybe String
      }
  | -- | A link to an anchor on the same web page @text The link text @anchor_name The anchor name. If the name is empty, the link must bring back to top @url An HTTP URL, opening the anchor
    RichTextAnchorLink
      { -- |
        url :: Maybe String,
        -- |
        anchor_name :: Maybe String,
        -- |
        _text :: Maybe RichText
      }
  | -- | A concatenation of rich texts @texts Texts
    RichTexts
      { -- |
        texts :: Maybe [RichText]
      }
  deriving (Eq)

instance Show RichText where
  show
    RichTextPlain
      { text = text_
      } =
      "RichTextPlain"
        ++ U.cc
          [ U.p "text" text_
          ]
  show
    RichTextBold
      { _text = _text_
      } =
      "RichTextBold"
        ++ U.cc
          [ U.p "_text" _text_
          ]
  show
    RichTextItalic
      { _text = _text_
      } =
      "RichTextItalic"
        ++ U.cc
          [ U.p "_text" _text_
          ]
  show
    RichTextUnderline
      { _text = _text_
      } =
      "RichTextUnderline"
        ++ U.cc
          [ U.p "_text" _text_
          ]
  show
    RichTextStrikethrough
      { _text = _text_
      } =
      "RichTextStrikethrough"
        ++ U.cc
          [ U.p "_text" _text_
          ]
  show
    RichTextFixed
      { _text = _text_
      } =
      "RichTextFixed"
        ++ U.cc
          [ U.p "_text" _text_
          ]
  show
    RichTextUrl
      { is_cached = is_cached_,
        url = url_,
        _text = _text_
      } =
      "RichTextUrl"
        ++ U.cc
          [ U.p "is_cached" is_cached_,
            U.p "url" url_,
            U.p "_text" _text_
          ]
  show
    RichTextEmailAddress
      { email_address = email_address_,
        _text = _text_
      } =
      "RichTextEmailAddress"
        ++ U.cc
          [ U.p "email_address" email_address_,
            U.p "_text" _text_
          ]
  show
    RichTextSubscript
      { _text = _text_
      } =
      "RichTextSubscript"
        ++ U.cc
          [ U.p "_text" _text_
          ]
  show
    RichTextSuperscript
      { _text = _text_
      } =
      "RichTextSuperscript"
        ++ U.cc
          [ U.p "_text" _text_
          ]
  show
    RichTextMarked
      { _text = _text_
      } =
      "RichTextMarked"
        ++ U.cc
          [ U.p "_text" _text_
          ]
  show
    RichTextPhoneNumber
      { phone_number = phone_number_,
        _text = _text_
      } =
      "RichTextPhoneNumber"
        ++ U.cc
          [ U.p "phone_number" phone_number_,
            U.p "_text" _text_
          ]
  show
    RichTextIcon
      { height = height_,
        width = width_,
        document = document_
      } =
      "RichTextIcon"
        ++ U.cc
          [ U.p "height" height_,
            U.p "width" width_,
            U.p "document" document_
          ]
  show
    RichTextReference
      { url = url_,
        anchor_name = anchor_name_,
        _text = _text_
      } =
      "RichTextReference"
        ++ U.cc
          [ U.p "url" url_,
            U.p "anchor_name" anchor_name_,
            U.p "_text" _text_
          ]
  show
    RichTextAnchor
      { name = name_
      } =
      "RichTextAnchor"
        ++ U.cc
          [ U.p "name" name_
          ]
  show
    RichTextAnchorLink
      { url = url_,
        anchor_name = anchor_name_,
        _text = _text_
      } =
      "RichTextAnchorLink"
        ++ U.cc
          [ U.p "url" url_,
            U.p "anchor_name" anchor_name_,
            U.p "_text" _text_
          ]
  show
    RichTexts
      { texts = texts_
      } =
      "RichTexts"
        ++ U.cc
          [ U.p "texts" texts_
          ]

instance T.FromJSON RichText where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "richTextPlain" -> parseRichTextPlain v
      "richTextBold" -> parseRichTextBold v
      "richTextItalic" -> parseRichTextItalic v
      "richTextUnderline" -> parseRichTextUnderline v
      "richTextStrikethrough" -> parseRichTextStrikethrough v
      "richTextFixed" -> parseRichTextFixed v
      "richTextUrl" -> parseRichTextUrl v
      "richTextEmailAddress" -> parseRichTextEmailAddress v
      "richTextSubscript" -> parseRichTextSubscript v
      "richTextSuperscript" -> parseRichTextSuperscript v
      "richTextMarked" -> parseRichTextMarked v
      "richTextPhoneNumber" -> parseRichTextPhoneNumber v
      "richTextIcon" -> parseRichTextIcon v
      "richTextReference" -> parseRichTextReference v
      "richTextAnchor" -> parseRichTextAnchor v
      "richTextAnchorLink" -> parseRichTextAnchorLink v
      "richTexts" -> parseRichTexts v
      _ -> mempty
    where
      parseRichTextPlain :: A.Value -> T.Parser RichText
      parseRichTextPlain = A.withObject "RichTextPlain" $ \o -> do
        text_ <- o A..:? "text"
        return $ RichTextPlain {text = text_}

      parseRichTextBold :: A.Value -> T.Parser RichText
      parseRichTextBold = A.withObject "RichTextBold" $ \o -> do
        _text_ <- o A..:? "text"
        return $ RichTextBold {_text = _text_}

      parseRichTextItalic :: A.Value -> T.Parser RichText
      parseRichTextItalic = A.withObject "RichTextItalic" $ \o -> do
        _text_ <- o A..:? "text"
        return $ RichTextItalic {_text = _text_}

      parseRichTextUnderline :: A.Value -> T.Parser RichText
      parseRichTextUnderline = A.withObject "RichTextUnderline" $ \o -> do
        _text_ <- o A..:? "text"
        return $ RichTextUnderline {_text = _text_}

      parseRichTextStrikethrough :: A.Value -> T.Parser RichText
      parseRichTextStrikethrough = A.withObject "RichTextStrikethrough" $ \o -> do
        _text_ <- o A..:? "text"
        return $ RichTextStrikethrough {_text = _text_}

      parseRichTextFixed :: A.Value -> T.Parser RichText
      parseRichTextFixed = A.withObject "RichTextFixed" $ \o -> do
        _text_ <- o A..:? "text"
        return $ RichTextFixed {_text = _text_}

      parseRichTextUrl :: A.Value -> T.Parser RichText
      parseRichTextUrl = A.withObject "RichTextUrl" $ \o -> do
        is_cached_ <- o A..:? "is_cached"
        url_ <- o A..:? "url"
        _text_ <- o A..:? "text"
        return $ RichTextUrl {is_cached = is_cached_, url = url_, _text = _text_}

      parseRichTextEmailAddress :: A.Value -> T.Parser RichText
      parseRichTextEmailAddress = A.withObject "RichTextEmailAddress" $ \o -> do
        email_address_ <- o A..:? "email_address"
        _text_ <- o A..:? "text"
        return $ RichTextEmailAddress {email_address = email_address_, _text = _text_}

      parseRichTextSubscript :: A.Value -> T.Parser RichText
      parseRichTextSubscript = A.withObject "RichTextSubscript" $ \o -> do
        _text_ <- o A..:? "text"
        return $ RichTextSubscript {_text = _text_}

      parseRichTextSuperscript :: A.Value -> T.Parser RichText
      parseRichTextSuperscript = A.withObject "RichTextSuperscript" $ \o -> do
        _text_ <- o A..:? "text"
        return $ RichTextSuperscript {_text = _text_}

      parseRichTextMarked :: A.Value -> T.Parser RichText
      parseRichTextMarked = A.withObject "RichTextMarked" $ \o -> do
        _text_ <- o A..:? "text"
        return $ RichTextMarked {_text = _text_}

      parseRichTextPhoneNumber :: A.Value -> T.Parser RichText
      parseRichTextPhoneNumber = A.withObject "RichTextPhoneNumber" $ \o -> do
        phone_number_ <- o A..:? "phone_number"
        _text_ <- o A..:? "text"
        return $ RichTextPhoneNumber {phone_number = phone_number_, _text = _text_}

      parseRichTextIcon :: A.Value -> T.Parser RichText
      parseRichTextIcon = A.withObject "RichTextIcon" $ \o -> do
        height_ <- o A..:? "height"
        width_ <- o A..:? "width"
        document_ <- o A..:? "document"
        return $ RichTextIcon {height = height_, width = width_, document = document_}

      parseRichTextReference :: A.Value -> T.Parser RichText
      parseRichTextReference = A.withObject "RichTextReference" $ \o -> do
        url_ <- o A..:? "url"
        anchor_name_ <- o A..:? "anchor_name"
        _text_ <- o A..:? "text"
        return $ RichTextReference {url = url_, anchor_name = anchor_name_, _text = _text_}

      parseRichTextAnchor :: A.Value -> T.Parser RichText
      parseRichTextAnchor = A.withObject "RichTextAnchor" $ \o -> do
        name_ <- o A..:? "name"
        return $ RichTextAnchor {name = name_}

      parseRichTextAnchorLink :: A.Value -> T.Parser RichText
      parseRichTextAnchorLink = A.withObject "RichTextAnchorLink" $ \o -> do
        url_ <- o A..:? "url"
        anchor_name_ <- o A..:? "anchor_name"
        _text_ <- o A..:? "text"
        return $ RichTextAnchorLink {url = url_, anchor_name = anchor_name_, _text = _text_}

      parseRichTexts :: A.Value -> T.Parser RichText
      parseRichTexts = A.withObject "RichTexts" $ \o -> do
        texts_ <- o A..:? "texts"
        return $ RichTexts {texts = texts_}
  parseJSON _ = mempty

instance T.ToJSON RichText where
  toJSON
    RichTextPlain
      { text = text_
      } =
      A.object
        [ "@type" A..= T.String "richTextPlain",
          "text" A..= text_
        ]
  toJSON
    RichTextBold
      { _text = _text_
      } =
      A.object
        [ "@type" A..= T.String "richTextBold",
          "text" A..= _text_
        ]
  toJSON
    RichTextItalic
      { _text = _text_
      } =
      A.object
        [ "@type" A..= T.String "richTextItalic",
          "text" A..= _text_
        ]
  toJSON
    RichTextUnderline
      { _text = _text_
      } =
      A.object
        [ "@type" A..= T.String "richTextUnderline",
          "text" A..= _text_
        ]
  toJSON
    RichTextStrikethrough
      { _text = _text_
      } =
      A.object
        [ "@type" A..= T.String "richTextStrikethrough",
          "text" A..= _text_
        ]
  toJSON
    RichTextFixed
      { _text = _text_
      } =
      A.object
        [ "@type" A..= T.String "richTextFixed",
          "text" A..= _text_
        ]
  toJSON
    RichTextUrl
      { is_cached = is_cached_,
        url = url_,
        _text = _text_
      } =
      A.object
        [ "@type" A..= T.String "richTextUrl",
          "is_cached" A..= is_cached_,
          "url" A..= url_,
          "text" A..= _text_
        ]
  toJSON
    RichTextEmailAddress
      { email_address = email_address_,
        _text = _text_
      } =
      A.object
        [ "@type" A..= T.String "richTextEmailAddress",
          "email_address" A..= email_address_,
          "text" A..= _text_
        ]
  toJSON
    RichTextSubscript
      { _text = _text_
      } =
      A.object
        [ "@type" A..= T.String "richTextSubscript",
          "text" A..= _text_
        ]
  toJSON
    RichTextSuperscript
      { _text = _text_
      } =
      A.object
        [ "@type" A..= T.String "richTextSuperscript",
          "text" A..= _text_
        ]
  toJSON
    RichTextMarked
      { _text = _text_
      } =
      A.object
        [ "@type" A..= T.String "richTextMarked",
          "text" A..= _text_
        ]
  toJSON
    RichTextPhoneNumber
      { phone_number = phone_number_,
        _text = _text_
      } =
      A.object
        [ "@type" A..= T.String "richTextPhoneNumber",
          "phone_number" A..= phone_number_,
          "text" A..= _text_
        ]
  toJSON
    RichTextIcon
      { height = height_,
        width = width_,
        document = document_
      } =
      A.object
        [ "@type" A..= T.String "richTextIcon",
          "height" A..= height_,
          "width" A..= width_,
          "document" A..= document_
        ]
  toJSON
    RichTextReference
      { url = url_,
        anchor_name = anchor_name_,
        _text = _text_
      } =
      A.object
        [ "@type" A..= T.String "richTextReference",
          "url" A..= url_,
          "anchor_name" A..= anchor_name_,
          "text" A..= _text_
        ]
  toJSON
    RichTextAnchor
      { name = name_
      } =
      A.object
        [ "@type" A..= T.String "richTextAnchor",
          "name" A..= name_
        ]
  toJSON
    RichTextAnchorLink
      { url = url_,
        anchor_name = anchor_name_,
        _text = _text_
      } =
      A.object
        [ "@type" A..= T.String "richTextAnchorLink",
          "url" A..= url_,
          "anchor_name" A..= anchor_name_,
          "text" A..= _text_
        ]
  toJSON
    RichTexts
      { texts = texts_
      } =
      A.object
        [ "@type" A..= T.String "richTexts",
          "texts" A..= texts_
        ]
