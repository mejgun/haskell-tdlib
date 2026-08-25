module TD.Data.CommunityFullInfo
  (CommunityFullInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatPhoto as ChatPhoto
import qualified TD.Data.CommunityChat as CommunityChat

data CommunityFullInfo
  = CommunityFullInfo -- ^ Contains full information about a community
    { photo                  :: Maybe ChatPhoto.ChatPhoto           -- ^ Photo of the community
    , chats                  :: Maybe [CommunityChat.CommunityChat] -- ^ Chats belonging to the community
    , administrator_count    :: Maybe Int                           -- ^ Number of privileged users in the community; 0 if the current user isn't an administrator of the community
    , banned_count           :: Maybe Int                           -- ^ Number of users banned from the community; 0 if the current user isn't an administrator of the community
    , add_chat_request_count :: Maybe Int                           -- ^ Number of pending requests for addition of chats to the community; 0 if the current user isn't an administrator of the community
    }
  deriving (Eq, Show)

instance I.ShortShow CommunityFullInfo where
  shortShow CommunityFullInfo
    { photo                  = photo_
    , chats                  = chats_
    , administrator_count    = administrator_count_
    , banned_count           = banned_count_
    , add_chat_request_count = add_chat_request_count_
    }
      = "CommunityFullInfo"
        ++ I.cc
        [ "photo"                  `I.p` photo_
        , "chats"                  `I.p` chats_
        , "administrator_count"    `I.p` administrator_count_
        , "banned_count"           `I.p` banned_count_
        , "add_chat_request_count" `I.p` add_chat_request_count_
        ]

instance AT.FromJSON CommunityFullInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "communityFullInfo" -> parseCommunityFullInfo v
      _                   -> mempty
    
    where
      parseCommunityFullInfo :: A.Value -> AT.Parser CommunityFullInfo
      parseCommunityFullInfo = A.withObject "CommunityFullInfo" $ \o -> do
        photo_                  <- o A..:?  "photo"
        chats_                  <- o A..:?  "chats"
        administrator_count_    <- o A..:?  "administrator_count"
        banned_count_           <- o A..:?  "banned_count"
        add_chat_request_count_ <- o A..:?  "add_chat_request_count"
        pure $ CommunityFullInfo
          { photo                  = photo_
          , chats                  = chats_
          , administrator_count    = administrator_count_
          , banned_count           = banned_count_
          , add_chat_request_count = add_chat_request_count_
          }
  parseJSON _ = mempty

