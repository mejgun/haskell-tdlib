module TD.Data.AnimatedEmoji
  ( AnimatedEmoji(..)    
  , defaultAnimatedEmoji 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.File as File

data AnimatedEmoji
  = AnimatedEmoji -- ^ Describes an animated or custom representation of an emoji
    { sticker          :: Maybe Sticker.Sticker -- ^ Sticker for the emoji; may be null if yet unknown for a custom emoji. If the sticker is a custom emoji, it can have arbitrary format different from stickerFormatTgs
    , sticker_width    :: Maybe Int             -- ^ Expected width of the sticker, which can be used if the sticker is null
    , sticker_height   :: Maybe Int             -- ^ Expected height of the sticker, which can be used if the sticker is null
    , fitzpatrick_type :: Maybe Int             -- ^ Emoji modifier fitzpatrick type; 0-6; 0 if none
    , sound            :: Maybe File.File       -- ^ File containing the sound to be played when the sticker is clicked; may be null. The sound is encoded with the Opus codec, and stored inside an OGG container
    }
  deriving (Eq)

instance Show AnimatedEmoji where
  show AnimatedEmoji
    { sticker          = sticker_
    , sticker_width    = sticker_width_
    , sticker_height   = sticker_height_
    , fitzpatrick_type = fitzpatrick_type_
    , sound            = sound_
    }
      = "AnimatedEmoji"
        ++ I.cc
        [ "sticker"          `I.p` sticker_
        , "sticker_width"    `I.p` sticker_width_
        , "sticker_height"   `I.p` sticker_height_
        , "fitzpatrick_type" `I.p` fitzpatrick_type_
        , "sound"            `I.p` sound_
        ]

instance AT.FromJSON AnimatedEmoji where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "animatedEmoji" -> parseAnimatedEmoji v
      _               -> mempty
    
    where
      parseAnimatedEmoji :: A.Value -> AT.Parser AnimatedEmoji
      parseAnimatedEmoji = A.withObject "AnimatedEmoji" $ \o -> do
        sticker_          <- o A..:?  "sticker"
        sticker_width_    <- o A..:?  "sticker_width"
        sticker_height_   <- o A..:?  "sticker_height"
        fitzpatrick_type_ <- o A..:?  "fitzpatrick_type"
        sound_            <- o A..:?  "sound"
        pure $ AnimatedEmoji
          { sticker          = sticker_
          , sticker_width    = sticker_width_
          , sticker_height   = sticker_height_
          , fitzpatrick_type = fitzpatrick_type_
          , sound            = sound_
          }
  parseJSON _ = mempty

instance AT.ToJSON AnimatedEmoji where
  toJSON AnimatedEmoji
    { sticker          = sticker_
    , sticker_width    = sticker_width_
    , sticker_height   = sticker_height_
    , fitzpatrick_type = fitzpatrick_type_
    , sound            = sound_
    }
      = A.object
        [ "@type"            A..= AT.String "animatedEmoji"
        , "sticker"          A..= sticker_
        , "sticker_width"    A..= sticker_width_
        , "sticker_height"   A..= sticker_height_
        , "fitzpatrick_type" A..= fitzpatrick_type_
        , "sound"            A..= sound_
        ]

defaultAnimatedEmoji :: AnimatedEmoji
defaultAnimatedEmoji =
  AnimatedEmoji
    { sticker          = Nothing
    , sticker_width    = Nothing
    , sticker_height   = Nothing
    , fitzpatrick_type = Nothing
    , sound            = Nothing
    }

