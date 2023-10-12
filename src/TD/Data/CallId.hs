module TD.Data.CallId where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data CallId
  = CallId -- ^ Contains the call identifier
    { _id :: Maybe Int -- ^ Call identifier
    }
  deriving (Eq)

instance Show CallId where
  show CallId
    { _id = _id_
    }
      = "CallId"
        ++ I.cc
        [ "_id" `I.p` _id_
        ]

instance AT.FromJSON CallId where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "callId" -> parseCallId v
      _        -> mempty
    
    where
      parseCallId :: A.Value -> AT.Parser CallId
      parseCallId = A.withObject "CallId" $ \o -> do
        _id_ <- o A..:?  "id"
        pure $ CallId
          { _id = _id_
          }

instance AT.ToJSON CallId where
  toJSON CallId
    { _id = _id_
    }
      = A.object
        [ "@type" A..= AT.String "callId"
        , "id"    A..= _id_
        ]
