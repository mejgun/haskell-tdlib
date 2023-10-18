module TD.Query.ConfirmSession
  (ConfirmSession(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Confirms an unconfirmed session of the current user from another device. Returns 'TD.Data.Ok.Ok'
data ConfirmSession
  = ConfirmSession
    { session_id :: Maybe Int -- ^ Session identifier
    }
  deriving (Eq, Show)

instance I.ShortShow ConfirmSession where
  shortShow
    ConfirmSession
      { session_id = session_id_
      }
        = "ConfirmSession"
          ++ I.cc
          [ "session_id" `I.p` session_id_
          ]

instance AT.ToJSON ConfirmSession where
  toJSON
    ConfirmSession
      { session_id = session_id_
      }
        = A.object
          [ "@type"      A..= AT.String "confirmSession"
          , "session_id" A..= fmap I.writeInt64  session_id_
          ]

