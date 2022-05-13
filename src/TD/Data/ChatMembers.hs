{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatMembers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatMember as ChatMember
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
      { members = members_,
        total_count = total_count_
      } =
      "ChatMembers"
        ++ U.cc
          [ U.p "members" members_,
            U.p "total_count" total_count_
          ]

instance T.FromJSON ChatMembers where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatMembers" -> parseChatMembers v
      _ -> mempty
    where
      parseChatMembers :: A.Value -> T.Parser ChatMembers
      parseChatMembers = A.withObject "ChatMembers" $ \o -> do
        members_ <- o A..:? "members"
        total_count_ <- mconcat [o A..:? "total_count", U.rm <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatMembers {members = members_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON ChatMembers where
  toJSON
    ChatMembers
      { members = members_,
        total_count = total_count_
      } =
      A.object
        [ "@type" A..= T.String "chatMembers",
          "members" A..= members_,
          "total_count" A..= total_count_
        ]
