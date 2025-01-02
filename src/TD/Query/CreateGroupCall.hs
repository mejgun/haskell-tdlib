module TD.Query.CreateGroupCall
  (CreateGroupCall(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Creates a group call from a one-to-one call. Returns 'TD.Data.Ok.Ok'
data CreateGroupCall
  = CreateGroupCall
    { call_id :: Maybe Int -- ^ Call identifier
    }
  deriving (Eq, Show)

instance I.ShortShow CreateGroupCall where
  shortShow
    CreateGroupCall
      { call_id = call_id_
      }
        = "CreateGroupCall"
          ++ I.cc
          [ "call_id" `I.p` call_id_
          ]

instance AT.ToJSON CreateGroupCall where
  toJSON
    CreateGroupCall
      { call_id = call_id_
      }
        = A.object
          [ "@type"   A..= AT.String "createGroupCall"
          , "call_id" A..= call_id_
          ]

