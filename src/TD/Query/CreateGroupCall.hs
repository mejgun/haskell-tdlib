module TD.Query.CreateGroupCall
  (CreateGroupCall(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.GroupCallJoinParameters as GroupCallJoinParameters

-- | Creates a new group call that isn't bound to a chat. Returns 'TD.Data.GroupCallInfo.GroupCallInfo'
data CreateGroupCall
  = CreateGroupCall
    { join_parameters :: Maybe GroupCallJoinParameters.GroupCallJoinParameters -- ^ Parameters to join the call; pass null to only create call link without joining the call
    }
  deriving (Eq, Show)

instance I.ShortShow CreateGroupCall where
  shortShow
    CreateGroupCall
      { join_parameters = join_parameters_
      }
        = "CreateGroupCall"
          ++ I.cc
          [ "join_parameters" `I.p` join_parameters_
          ]

instance AT.ToJSON CreateGroupCall where
  toJSON
    CreateGroupCall
      { join_parameters = join_parameters_
      }
        = A.object
          [ "@type"           A..= AT.String "createGroupCall"
          , "join_parameters" A..= join_parameters_
          ]

