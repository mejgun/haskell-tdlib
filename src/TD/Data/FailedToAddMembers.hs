module TD.Data.FailedToAddMembers
  (FailedToAddMembers(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FailedToAddMember as FailedToAddMember

data FailedToAddMembers
  = FailedToAddMembers -- ^ Represents a list of users that has failed to be added to a chat
    { failed_to_add_members :: Maybe [FailedToAddMember.FailedToAddMember] -- ^ Information about users that weren't added to the chat
    }
  deriving (Eq, Show)

instance I.ShortShow FailedToAddMembers where
  shortShow FailedToAddMembers
    { failed_to_add_members = failed_to_add_members_
    }
      = "FailedToAddMembers"
        ++ I.cc
        [ "failed_to_add_members" `I.p` failed_to_add_members_
        ]

instance AT.FromJSON FailedToAddMembers where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "failedToAddMembers" -> parseFailedToAddMembers v
      _                    -> mempty
    
    where
      parseFailedToAddMembers :: A.Value -> AT.Parser FailedToAddMembers
      parseFailedToAddMembers = A.withObject "FailedToAddMembers" $ \o -> do
        failed_to_add_members_ <- o A..:?  "failed_to_add_members"
        pure $ FailedToAddMembers
          { failed_to_add_members = failed_to_add_members_
          }
  parseJSON _ = mempty

