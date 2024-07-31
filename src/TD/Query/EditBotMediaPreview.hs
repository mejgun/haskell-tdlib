module TD.Query.EditBotMediaPreview
  (EditBotMediaPreview(..)
  , defaultEditBotMediaPreview
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.InputStoryContent as InputStoryContent

-- | Replaces media preview in the list of media previews of a bot. Returns the new preview after edit is completed server-side. Returns 'TD.Data.BotMediaPreview.BotMediaPreview'
data EditBotMediaPreview
  = EditBotMediaPreview
    { bot_user_id   :: Maybe Int                                 -- ^ Identifier of the target bot. The bot must be owned and must have the main Web App
    , language_code :: Maybe T.Text                              -- ^ Language code of the media preview to edit
    , file_id       :: Maybe Int                                 -- ^ File identifier of the media to replace
    , content       :: Maybe InputStoryContent.InputStoryContent -- ^ Content of the new preview
    }
  deriving (Eq, Show)

instance I.ShortShow EditBotMediaPreview where
  shortShow
    EditBotMediaPreview
      { bot_user_id   = bot_user_id_
      , language_code = language_code_
      , file_id       = file_id_
      , content       = content_
      }
        = "EditBotMediaPreview"
          ++ I.cc
          [ "bot_user_id"   `I.p` bot_user_id_
          , "language_code" `I.p` language_code_
          , "file_id"       `I.p` file_id_
          , "content"       `I.p` content_
          ]

instance AT.ToJSON EditBotMediaPreview where
  toJSON
    EditBotMediaPreview
      { bot_user_id   = bot_user_id_
      , language_code = language_code_
      , file_id       = file_id_
      , content       = content_
      }
        = A.object
          [ "@type"         A..= AT.String "editBotMediaPreview"
          , "bot_user_id"   A..= bot_user_id_
          , "language_code" A..= language_code_
          , "file_id"       A..= file_id_
          , "content"       A..= content_
          ]

defaultEditBotMediaPreview :: EditBotMediaPreview
defaultEditBotMediaPreview =
  EditBotMediaPreview
    { bot_user_id   = Nothing
    , language_code = Nothing
    , file_id       = Nothing
    , content       = Nothing
    }

