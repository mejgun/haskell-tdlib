module TD.Data.InputSticker
  ( InputSticker(..)    
  , defaultInputSticker 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.StickerFormat as StickerFormat
import qualified Data.Text as T
import qualified TD.Data.MaskPosition as MaskPosition

data InputSticker
  = InputSticker -- ^ A sticker to be added to a sticker set
    { sticker       :: Maybe InputFile.InputFile         -- ^ File with the sticker; must fit in a 512x512 square. For WEBP stickers the file must be in WEBP or PNG format, which will be converted to WEBP server-side. See https://core.telegram.org/animated_stickers#technical-requirements for technical requirements
    , format        :: Maybe StickerFormat.StickerFormat -- ^ Format of the sticker
    , emojis        :: Maybe T.Text                      -- ^ String with 1-20 emoji corresponding to the sticker
    , mask_position :: Maybe MaskPosition.MaskPosition   -- ^ Position where the mask is placed; pass null if not specified
    , keywords      :: Maybe [T.Text]                    -- ^ List of up to 20 keywords with total length up to 64 characters, which can be used to find the sticker
    }
  deriving (Eq, Show)

instance I.ShortShow InputSticker where
  shortShow InputSticker
    { sticker       = sticker_
    , format        = format_
    , emojis        = emojis_
    , mask_position = mask_position_
    , keywords      = keywords_
    }
      = "InputSticker"
        ++ I.cc
        [ "sticker"       `I.p` sticker_
        , "format"        `I.p` format_
        , "emojis"        `I.p` emojis_
        , "mask_position" `I.p` mask_position_
        , "keywords"      `I.p` keywords_
        ]

instance AT.FromJSON InputSticker where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputSticker" -> parseInputSticker v
      _              -> mempty
    
    where
      parseInputSticker :: A.Value -> AT.Parser InputSticker
      parseInputSticker = A.withObject "InputSticker" $ \o -> do
        sticker_       <- o A..:?  "sticker"
        format_        <- o A..:?  "format"
        emojis_        <- o A..:?  "emojis"
        mask_position_ <- o A..:?  "mask_position"
        keywords_      <- o A..:?  "keywords"
        pure $ InputSticker
          { sticker       = sticker_
          , format        = format_
          , emojis        = emojis_
          , mask_position = mask_position_
          , keywords      = keywords_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputSticker where
  toJSON InputSticker
    { sticker       = sticker_
    , format        = format_
    , emojis        = emojis_
    , mask_position = mask_position_
    , keywords      = keywords_
    }
      = A.object
        [ "@type"         A..= AT.String "inputSticker"
        , "sticker"       A..= sticker_
        , "format"        A..= format_
        , "emojis"        A..= emojis_
        , "mask_position" A..= mask_position_
        , "keywords"      A..= keywords_
        ]

defaultInputSticker :: InputSticker
defaultInputSticker =
  InputSticker
    { sticker       = Nothing
    , format        = Nothing
    , emojis        = Nothing
    , mask_position = Nothing
    , keywords      = Nothing
    }

