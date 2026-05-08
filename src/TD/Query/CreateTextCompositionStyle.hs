module TD.Query.CreateTextCompositionStyle
  (CreateTextCompositionStyle(..)
  , defaultCreateTextCompositionStyle
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Creates a custom text composition style. May return an error with a message "TONES_SAVED_TOO_MANY" if the maximum number of added custom styles has been reached. Returns 'TD.Data.TextCompositionStyle.TextCompositionStyle'
data CreateTextCompositionStyle
  = CreateTextCompositionStyle
    { title           :: Maybe T.Text -- ^ Title of the style; 1-getOption("text_composition_style_title_length_max") characters
    , custom_emoji_id :: Maybe Int    -- ^ Identifier of the custom emoji corresponding to the style
    , prompt          :: Maybe T.Text -- ^ Prompt that will be used for text composition; 1-getOption("text_composition_style_prompt_length_max") characters
    , show_creator    :: Maybe Bool   -- ^ Pass true if the current user must be shown as the creator of the style
    }
  deriving (Eq, Show)

instance I.ShortShow CreateTextCompositionStyle where
  shortShow
    CreateTextCompositionStyle
      { title           = title_
      , custom_emoji_id = custom_emoji_id_
      , prompt          = prompt_
      , show_creator    = show_creator_
      }
        = "CreateTextCompositionStyle"
          ++ I.cc
          [ "title"           `I.p` title_
          , "custom_emoji_id" `I.p` custom_emoji_id_
          , "prompt"          `I.p` prompt_
          , "show_creator"    `I.p` show_creator_
          ]

instance AT.ToJSON CreateTextCompositionStyle where
  toJSON
    CreateTextCompositionStyle
      { title           = title_
      , custom_emoji_id = custom_emoji_id_
      , prompt          = prompt_
      , show_creator    = show_creator_
      }
        = A.object
          [ "@type"           A..= AT.String "createTextCompositionStyle"
          , "title"           A..= title_
          , "custom_emoji_id" A..= fmap I.writeInt64  custom_emoji_id_
          , "prompt"          A..= prompt_
          , "show_creator"    A..= show_creator_
          ]

defaultCreateTextCompositionStyle :: CreateTextCompositionStyle
defaultCreateTextCompositionStyle =
  CreateTextCompositionStyle
    { title           = Nothing
    , custom_emoji_id = Nothing
    , prompt          = Nothing
    , show_creator    = Nothing
    }

