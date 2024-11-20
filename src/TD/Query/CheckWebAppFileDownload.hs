module TD.Query.CheckWebAppFileDownload
  (CheckWebAppFileDownload(..)
  , defaultCheckWebAppFileDownload
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Checks whether a file can be downloaded and saved locally by Web App request. Returns 'TD.Data.Ok.Ok'
data CheckWebAppFileDownload
  = CheckWebAppFileDownload
    { bot_user_id :: Maybe Int    -- ^ Identifier of the bot, providing the Web App
    , file_name   :: Maybe T.Text -- ^ Name of the file
    , url         :: Maybe T.Text -- ^ URL of the file
    }
  deriving (Eq, Show)

instance I.ShortShow CheckWebAppFileDownload where
  shortShow
    CheckWebAppFileDownload
      { bot_user_id = bot_user_id_
      , file_name   = file_name_
      , url         = url_
      }
        = "CheckWebAppFileDownload"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          , "file_name"   `I.p` file_name_
          , "url"         `I.p` url_
          ]

instance AT.ToJSON CheckWebAppFileDownload where
  toJSON
    CheckWebAppFileDownload
      { bot_user_id = bot_user_id_
      , file_name   = file_name_
      , url         = url_
      }
        = A.object
          [ "@type"       A..= AT.String "checkWebAppFileDownload"
          , "bot_user_id" A..= bot_user_id_
          , "file_name"   A..= file_name_
          , "url"         A..= url_
          ]

defaultCheckWebAppFileDownload :: CheckWebAppFileDownload
defaultCheckWebAppFileDownload =
  CheckWebAppFileDownload
    { bot_user_id = Nothing
    , file_name   = Nothing
    , url         = Nothing
    }

