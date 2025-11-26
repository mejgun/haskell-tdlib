module TD.Data.GroupCallMessageLevel
  (GroupCallMessageLevel(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GroupCallMessageLevel
  = GroupCallMessageLevel -- ^ Represents a level of features for a message sent in a live story group call
    { min_star_count         :: Maybe Int -- ^ The minimum number of Telegram Stars required to get features of the level
    , pin_duration           :: Maybe Int -- ^ The amount of time the message of this level will be pinned, in seconds
    , max_text_length        :: Maybe Int -- ^ The maximum allowed length of the message text
    , max_custom_emoji_count :: Maybe Int -- ^ The maximum allowed number of custom emoji in the message text
    , first_color            :: Maybe Int -- ^ The first color used to show the message text in the RGB format
    , second_color           :: Maybe Int -- ^ The second color used to show the message text in the RGB format
    , background_color       :: Maybe Int -- ^ Background color for the message the RGB format
    }
  deriving (Eq, Show)

instance I.ShortShow GroupCallMessageLevel where
  shortShow GroupCallMessageLevel
    { min_star_count         = min_star_count_
    , pin_duration           = pin_duration_
    , max_text_length        = max_text_length_
    , max_custom_emoji_count = max_custom_emoji_count_
    , first_color            = first_color_
    , second_color           = second_color_
    , background_color       = background_color_
    }
      = "GroupCallMessageLevel"
        ++ I.cc
        [ "min_star_count"         `I.p` min_star_count_
        , "pin_duration"           `I.p` pin_duration_
        , "max_text_length"        `I.p` max_text_length_
        , "max_custom_emoji_count" `I.p` max_custom_emoji_count_
        , "first_color"            `I.p` first_color_
        , "second_color"           `I.p` second_color_
        , "background_color"       `I.p` background_color_
        ]

instance AT.FromJSON GroupCallMessageLevel where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "groupCallMessageLevel" -> parseGroupCallMessageLevel v
      _                       -> mempty
    
    where
      parseGroupCallMessageLevel :: A.Value -> AT.Parser GroupCallMessageLevel
      parseGroupCallMessageLevel = A.withObject "GroupCallMessageLevel" $ \o -> do
        min_star_count_         <- o A..:?  "min_star_count"
        pin_duration_           <- o A..:?  "pin_duration"
        max_text_length_        <- o A..:?  "max_text_length"
        max_custom_emoji_count_ <- o A..:?  "max_custom_emoji_count"
        first_color_            <- o A..:?  "first_color"
        second_color_           <- o A..:?  "second_color"
        background_color_       <- o A..:?  "background_color"
        pure $ GroupCallMessageLevel
          { min_star_count         = min_star_count_
          , pin_duration           = pin_duration_
          , max_text_length        = max_text_length_
          , max_custom_emoji_count = max_custom_emoji_count_
          , first_color            = first_color_
          , second_color           = second_color_
          , background_color       = background_color_
          }
  parseJSON _ = mempty

