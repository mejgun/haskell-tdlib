module TD.Data.ChatMembers
  (ChatMembers(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatMember as ChatMember

data ChatMembers
  = ChatMembers -- ^ Contains a list of chat members
    { total_count :: Maybe Int                     -- ^ Approximate total number of chat members found
    , members     :: Maybe [ChatMember.ChatMember] -- ^ A list of chat members
    }
  deriving (Eq, Show)

instance I.ShortShow ChatMembers where
  shortShow ChatMembers
    { total_count = total_count_
    , members     = members_
    }
      = "ChatMembers"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "members"     `I.p` members_
        ]

instance AT.FromJSON ChatMembers where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatMembers" -> parseChatMembers v
      _             -> mempty
    
    where
      parseChatMembers :: A.Value -> AT.Parser ChatMembers
      parseChatMembers = A.withObject "ChatMembers" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        members_     <- o A..:?  "members"
        pure $ ChatMembers
          { total_count = total_count_
          , members     = members_
          }
  parseJSON _ = mempty

