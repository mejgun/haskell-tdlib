module TD.Data.CreatedBasicGroupChat
  (CreatedBasicGroupChat(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FailedToAddMembers as FailedToAddMembers

data CreatedBasicGroupChat
  = CreatedBasicGroupChat -- ^ Contains information about a newly created basic group chat
    { chat_id               :: Maybe Int                                   -- ^ Chat identifier
    , failed_to_add_members :: Maybe FailedToAddMembers.FailedToAddMembers -- ^ Information about failed to add members
    }
  deriving (Eq, Show)

instance I.ShortShow CreatedBasicGroupChat where
  shortShow CreatedBasicGroupChat
    { chat_id               = chat_id_
    , failed_to_add_members = failed_to_add_members_
    }
      = "CreatedBasicGroupChat"
        ++ I.cc
        [ "chat_id"               `I.p` chat_id_
        , "failed_to_add_members" `I.p` failed_to_add_members_
        ]

instance AT.FromJSON CreatedBasicGroupChat where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "createdBasicGroupChat" -> parseCreatedBasicGroupChat v
      _                       -> mempty
    
    where
      parseCreatedBasicGroupChat :: A.Value -> AT.Parser CreatedBasicGroupChat
      parseCreatedBasicGroupChat = A.withObject "CreatedBasicGroupChat" $ \o -> do
        chat_id_               <- o A..:?  "chat_id"
        failed_to_add_members_ <- o A..:?  "failed_to_add_members"
        pure $ CreatedBasicGroupChat
          { chat_id               = chat_id_
          , failed_to_add_members = failed_to_add_members_
          }
  parseJSON _ = mempty

