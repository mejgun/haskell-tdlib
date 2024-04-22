module TD.Query.ToggleSupergroupCanHaveSponsoredMessages
  (ToggleSupergroupCanHaveSponsoredMessages(..)
  , defaultToggleSupergroupCanHaveSponsoredMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether sponsored messages are shown in the channel chat; requires owner privileges in the channel. The chat must have at least chatBoostFeatures.min_sponsored_message_disable_boost_level boost level to disable sponsored messages. Returns 'TD.Data.Ok.Ok'
data ToggleSupergroupCanHaveSponsoredMessages
  = ToggleSupergroupCanHaveSponsoredMessages
    { supergroup_id               :: Maybe Int  -- ^ The identifier of the channel
    , can_have_sponsored_messages :: Maybe Bool -- ^ The new value of can_have_sponsored_messages
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleSupergroupCanHaveSponsoredMessages where
  shortShow
    ToggleSupergroupCanHaveSponsoredMessages
      { supergroup_id               = supergroup_id_
      , can_have_sponsored_messages = can_have_sponsored_messages_
      }
        = "ToggleSupergroupCanHaveSponsoredMessages"
          ++ I.cc
          [ "supergroup_id"               `I.p` supergroup_id_
          , "can_have_sponsored_messages" `I.p` can_have_sponsored_messages_
          ]

instance AT.ToJSON ToggleSupergroupCanHaveSponsoredMessages where
  toJSON
    ToggleSupergroupCanHaveSponsoredMessages
      { supergroup_id               = supergroup_id_
      , can_have_sponsored_messages = can_have_sponsored_messages_
      }
        = A.object
          [ "@type"                       A..= AT.String "toggleSupergroupCanHaveSponsoredMessages"
          , "supergroup_id"               A..= supergroup_id_
          , "can_have_sponsored_messages" A..= can_have_sponsored_messages_
          ]

defaultToggleSupergroupCanHaveSponsoredMessages :: ToggleSupergroupCanHaveSponsoredMessages
defaultToggleSupergroupCanHaveSponsoredMessages =
  ToggleSupergroupCanHaveSponsoredMessages
    { supergroup_id               = Nothing
    , can_have_sponsored_messages = Nothing
    }

