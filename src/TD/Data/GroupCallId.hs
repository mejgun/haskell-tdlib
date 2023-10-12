module TD.Data.GroupCallId where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GroupCallId
  = GroupCallId -- ^ Contains the group call identifier
    { _id :: Maybe Int -- ^ Group call identifier
    }
  deriving (Eq)

instance Show GroupCallId where
  show GroupCallId
    { _id = _id_
    }
      = "GroupCallId"
        ++ I.cc
        [ "_id" `I.p` _id_
        ]

instance AT.FromJSON GroupCallId where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "groupCallId" -> parseGroupCallId v
      _             -> mempty
    
    where
      parseGroupCallId :: A.Value -> AT.Parser GroupCallId
      parseGroupCallId = A.withObject "GroupCallId" $ \o -> do
        _id_ <- o A..:?  "id"
        pure $ GroupCallId
          { _id = _id_
          }

instance AT.ToJSON GroupCallId where
  toJSON GroupCallId
    { _id = _id_
    }
      = A.object
        [ "@type" A..= AT.String "groupCallId"
        , "id"    A..= _id_
        ]
