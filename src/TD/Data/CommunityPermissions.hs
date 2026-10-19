module TD.Data.CommunityPermissions
  ( CommunityPermissions(..)    
  , defaultCommunityPermissions 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data CommunityPermissions
  = CommunityPermissions -- ^ Describes actions that a user is allowed to take in a community
    { can_edit_chat_list :: Maybe Bool -- ^ True, if the user can change the chats added to the community
    }
  deriving (Eq, Show)

instance I.ShortShow CommunityPermissions where
  shortShow CommunityPermissions
    { can_edit_chat_list = can_edit_chat_list_
    }
      = "CommunityPermissions"
        ++ I.cc
        [ "can_edit_chat_list" `I.p` can_edit_chat_list_
        ]

instance AT.FromJSON CommunityPermissions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "communityPermissions" -> parseCommunityPermissions v
      _                      -> mempty
    
    where
      parseCommunityPermissions :: A.Value -> AT.Parser CommunityPermissions
      parseCommunityPermissions = A.withObject "CommunityPermissions" $ \o -> do
        can_edit_chat_list_ <- o A..:?  "can_edit_chat_list"
        pure $ CommunityPermissions
          { can_edit_chat_list = can_edit_chat_list_
          }
  parseJSON _ = mempty

instance AT.ToJSON CommunityPermissions where
  toJSON CommunityPermissions
    { can_edit_chat_list = can_edit_chat_list_
    }
      = A.object
        [ "@type"              A..= AT.String "communityPermissions"
        , "can_edit_chat_list" A..= can_edit_chat_list_
        ]

defaultCommunityPermissions :: CommunityPermissions
defaultCommunityPermissions =
  CommunityPermissions
    { can_edit_chat_list = Nothing
    }

