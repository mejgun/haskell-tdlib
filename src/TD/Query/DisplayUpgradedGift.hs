module TD.Query.DisplayUpgradedGift
  (DisplayUpgradedGift(..)
  , defaultDisplayUpgradedGift
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified Data.Text as T

-- | Shows an upgraded gift from the TON wallet of the current user on a profile page or hides it from all profile pages; the gift remains in the wallet. Returns 'TD.Data.Ok.Ok'
data DisplayUpgradedGift
  = DisplayUpgradedGift
    { owner_id :: Maybe MessageSender.MessageSender -- ^ Identifier of the current user or a channel chat owned by the current user on whose profile page the gift will be shown; pass null to hide the gift from all profile pages
    , name     :: Maybe T.Text                      -- ^ Unique name of the upgraded gift
    }
  deriving (Eq, Show)

instance I.ShortShow DisplayUpgradedGift where
  shortShow
    DisplayUpgradedGift
      { owner_id = owner_id_
      , name     = name_
      }
        = "DisplayUpgradedGift"
          ++ I.cc
          [ "owner_id" `I.p` owner_id_
          , "name"     `I.p` name_
          ]

instance AT.ToJSON DisplayUpgradedGift where
  toJSON
    DisplayUpgradedGift
      { owner_id = owner_id_
      , name     = name_
      }
        = A.object
          [ "@type"    A..= AT.String "displayUpgradedGift"
          , "owner_id" A..= owner_id_
          , "name"     A..= name_
          ]

defaultDisplayUpgradedGift :: DisplayUpgradedGift
defaultDisplayUpgradedGift =
  DisplayUpgradedGift
    { owner_id = Nothing
    , name     = Nothing
    }

