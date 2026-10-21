module TD.Query.GetUserLink
  (GetUserLink(..)
  , defaultGetUserLink
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns an HTTPS link, which can be used to get information about the current user. Returns 'TD.Data.UserLink.UserLink'
data GetUserLink
  = GetUserLink
    { remove_messages_fee   :: Maybe Bool -- ^ Pass true to get a link, which allows other users to send unpaid messages to the current user. By default, a temporary link is returned in this case
    , return_permanent_link :: Maybe Bool -- ^ Pass true to get a permanent link; ignored if remove_messages_fee is false. Can be used only if can_get_permanent_link is true in a previously received userLink
    , revoke_previous_links :: Maybe Bool -- ^ Pass true to revoke previously created links, which allow other users to send unpaid messages to the current user; ignored if remove_messages_fee is false. If return_permanent_link is true, then the permanent link is revoked too; otherwise, only temporary links are revoked
    }
  deriving (Eq, Show)

instance I.ShortShow GetUserLink where
  shortShow
    GetUserLink
      { remove_messages_fee   = remove_messages_fee_
      , return_permanent_link = return_permanent_link_
      , revoke_previous_links = revoke_previous_links_
      }
        = "GetUserLink"
          ++ I.cc
          [ "remove_messages_fee"   `I.p` remove_messages_fee_
          , "return_permanent_link" `I.p` return_permanent_link_
          , "revoke_previous_links" `I.p` revoke_previous_links_
          ]

instance AT.ToJSON GetUserLink where
  toJSON
    GetUserLink
      { remove_messages_fee   = remove_messages_fee_
      , return_permanent_link = return_permanent_link_
      , revoke_previous_links = revoke_previous_links_
      }
        = A.object
          [ "@type"                 A..= AT.String "getUserLink"
          , "remove_messages_fee"   A..= remove_messages_fee_
          , "return_permanent_link" A..= return_permanent_link_
          , "revoke_previous_links" A..= revoke_previous_links_
          ]

defaultGetUserLink :: GetUserLink
defaultGetUserLink =
  GetUserLink
    { remove_messages_fee   = Nothing
    , return_permanent_link = Nothing
    , revoke_previous_links = Nothing
    }

