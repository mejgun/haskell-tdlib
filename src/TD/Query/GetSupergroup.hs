module TD.Query.GetSupergroup
  (GetSupergroup(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GetSupergroup -- ^ Returns information about a supergroup or a channel by its identifier. This is an offline request if the current user is not a bot
  = GetSupergroup
    { supergroup_id :: Maybe Int -- ^ Supergroup or channel identifier
    }
  deriving (Eq)

instance Show GetSupergroup where
  show
    GetSupergroup
      { supergroup_id = supergroup_id_
      }
        = "GetSupergroup"
          ++ I.cc
          [ "supergroup_id" `I.p` supergroup_id_
          ]

instance AT.ToJSON GetSupergroup where
  toJSON
    GetSupergroup
      { supergroup_id = supergroup_id_
      }
        = A.object
          [ "@type"         A..= AT.String "getSupergroup"
          , "supergroup_id" A..= supergroup_id_
          ]

