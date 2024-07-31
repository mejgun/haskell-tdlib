module TD.Query.AddBotMediaPreview
  (AddBotMediaPreview(..)
  , defaultAddBotMediaPreview
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.InputStoryContent as InputStoryContent

-- | Adds a new media preview to the beginning of the list of media previews of a bot. Returns the added preview after addition is completed server-side. The total number of previews must not exceed getOption("bot_media_preview_count_max") for the given language. Returns 'TD.Data.BotMediaPreview.BotMediaPreview'
data AddBotMediaPreview
  = AddBotMediaPreview
    { bot_user_id   :: Maybe Int                                 -- ^ Identifier of the target bot. The bot must be owned and must have the main Web App
    , language_code :: Maybe T.Text                              -- ^ A two-letter ISO 639-1 language code for which preview is added. If empty, then the preview will be shown to all users for whose languages there are no dedicated previews. If non-empty, then there must be an official language pack of the same name, which is returned by getLocalizationTargetInfo
    , content       :: Maybe InputStoryContent.InputStoryContent -- ^ Content of the added preview
    }
  deriving (Eq, Show)

instance I.ShortShow AddBotMediaPreview where
  shortShow
    AddBotMediaPreview
      { bot_user_id   = bot_user_id_
      , language_code = language_code_
      , content       = content_
      }
        = "AddBotMediaPreview"
          ++ I.cc
          [ "bot_user_id"   `I.p` bot_user_id_
          , "language_code" `I.p` language_code_
          , "content"       `I.p` content_
          ]

instance AT.ToJSON AddBotMediaPreview where
  toJSON
    AddBotMediaPreview
      { bot_user_id   = bot_user_id_
      , language_code = language_code_
      , content       = content_
      }
        = A.object
          [ "@type"         A..= AT.String "addBotMediaPreview"
          , "bot_user_id"   A..= bot_user_id_
          , "language_code" A..= language_code_
          , "content"       A..= content_
          ]

defaultAddBotMediaPreview :: AddBotMediaPreview
defaultAddBotMediaPreview =
  AddBotMediaPreview
    { bot_user_id   = Nothing
    , language_code = Nothing
    , content       = Nothing
    }

