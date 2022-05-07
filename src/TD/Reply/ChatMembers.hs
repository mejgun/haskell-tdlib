{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.ChatMembers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ChatMember as ChatMember
import qualified Utils as U

data ChatMembers = -- | Contains a list of chat members @total_count Approximate total number of chat members found @members A list of chat members
  ChatMembers
  { -- |
    members :: Maybe [ChatMember.ChatMember],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show ChatMembers where
  show
    ChatMembers
      { members = members,
        total_count = total_count
      } =
      "ChatMembers"
        ++ U.cc
          [ U.p "members" members,
            U.p "total_count" total_count
          ]

instance T.FromJSON ChatMembers where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatMembers" -> parseChatMembers v
      _ -> fail ""
    where
      parseChatMembers :: A.Value -> T.Parser ChatMembers
      parseChatMembers = A.withObject "ChatMembers" $ \o -> do
        members_ <- o A..:? "members"
        total_count_ <- mconcat [o A..:? "total_count", U.rm <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatMembers {members = members_, total_count = total_count_}
  parseJSON _ = fail ""

instance T.ToJSON ChatMembers where
  toJSON
    ChatMembers
      { members = members,
        total_count = total_count
      } =
      A.object
        [ "@type" A..= T.String "chatMembers",
          "members" A..= members,
          "total_count" A..= total_count
        ]
