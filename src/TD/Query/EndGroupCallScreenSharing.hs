module TD.Query.EndGroupCallScreenSharing(EndGroupCallScreenSharing(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data EndGroupCallScreenSharing -- ^ Ends screen sharing in a joined group call
  = EndGroupCallScreenSharing
    { group_call_id :: Maybe Int -- ^ Group call identifier
    }
  deriving (Eq)

instance Show EndGroupCallScreenSharing where
  show
    EndGroupCallScreenSharing
      { group_call_id = group_call_id_
      }
        = "EndGroupCallScreenSharing"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          ]

instance AT.ToJSON EndGroupCallScreenSharing where
  toJSON
    EndGroupCallScreenSharing
      { group_call_id = group_call_id_
      }
        = A.object
          [ "@type"         A..= AT.String "endGroupCallScreenSharing"
          , "group_call_id" A..= group_call_id_
          ]
