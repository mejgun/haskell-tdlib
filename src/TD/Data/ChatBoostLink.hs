{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatBoostLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ChatBoostLink = -- | Contains an HTTPS link to boost a chat @link The link @is_public True, if the link will work for non-members of the chat
  ChatBoostLink
  { -- |
    is_public :: Maybe Bool,
    -- |
    link :: Maybe String
  }
  deriving (Eq)

instance Show ChatBoostLink where
  show
    ChatBoostLink
      { is_public = is_public_,
        link = link_
      } =
      "ChatBoostLink"
        ++ U.cc
          [ U.p "is_public" is_public_,
            U.p "link" link_
          ]

instance T.FromJSON ChatBoostLink where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatBoostLink" -> parseChatBoostLink v
      _ -> mempty
    where
      parseChatBoostLink :: A.Value -> T.Parser ChatBoostLink
      parseChatBoostLink = A.withObject "ChatBoostLink" $ \o -> do
        is_public_ <- o A..:? "is_public"
        link_ <- o A..:? "link"
        return $ ChatBoostLink {is_public = is_public_, link = link_}
  parseJSON _ = mempty

instance T.ToJSON ChatBoostLink where
  toJSON
    ChatBoostLink
      { is_public = is_public_,
        link = link_
      } =
      A.object
        [ "@type" A..= T.String "chatBoostLink",
          "is_public" A..= is_public_,
          "link" A..= link_
        ]
