module TD.Query.AddApplicationChangelog
  (AddApplicationChangelog(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Adds server-provided application changelog as messages to the chat 777000 (Telegram) or as a stories; for official applications only. Returns a 404 error if nothing changed. Returns 'TD.Data.Ok.Ok'
data AddApplicationChangelog
  = AddApplicationChangelog
    { previous_application_version :: Maybe T.Text -- ^ The previous application version
    }
  deriving (Eq, Show)

instance I.ShortShow AddApplicationChangelog where
  shortShow
    AddApplicationChangelog
      { previous_application_version = previous_application_version_
      }
        = "AddApplicationChangelog"
          ++ I.cc
          [ "previous_application_version" `I.p` previous_application_version_
          ]

instance AT.ToJSON AddApplicationChangelog where
  toJSON
    AddApplicationChangelog
      { previous_application_version = previous_application_version_
      }
        = A.object
          [ "@type"                        A..= AT.String "addApplicationChangelog"
          , "previous_application_version" A..= previous_application_version_
          ]

