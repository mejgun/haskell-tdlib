module TD.Query.DeleteBotMediaPreviews
  (DeleteBotMediaPreviews(..)
  , defaultDeleteBotMediaPreviews
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Delete media previews from the list of media previews of a bot. Returns 'TD.Data.Ok.Ok'
data DeleteBotMediaPreviews
  = DeleteBotMediaPreviews
    { bot_user_id   :: Maybe Int    -- ^ Identifier of the target bot. The bot must be owned and must have the main Web App
    , language_code :: Maybe T.Text -- ^ Language code of the media previews to delete
    , file_ids      :: Maybe [Int]  -- ^ File identifiers of the media to delete
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteBotMediaPreviews where
  shortShow
    DeleteBotMediaPreviews
      { bot_user_id   = bot_user_id_
      , language_code = language_code_
      , file_ids      = file_ids_
      }
        = "DeleteBotMediaPreviews"
          ++ I.cc
          [ "bot_user_id"   `I.p` bot_user_id_
          , "language_code" `I.p` language_code_
          , "file_ids"      `I.p` file_ids_
          ]

instance AT.ToJSON DeleteBotMediaPreviews where
  toJSON
    DeleteBotMediaPreviews
      { bot_user_id   = bot_user_id_
      , language_code = language_code_
      , file_ids      = file_ids_
      }
        = A.object
          [ "@type"         A..= AT.String "deleteBotMediaPreviews"
          , "bot_user_id"   A..= bot_user_id_
          , "language_code" A..= language_code_
          , "file_ids"      A..= file_ids_
          ]

defaultDeleteBotMediaPreviews :: DeleteBotMediaPreviews
defaultDeleteBotMediaPreviews =
  DeleteBotMediaPreviews
    { bot_user_id   = Nothing
    , language_code = Nothing
    , file_ids      = Nothing
    }

