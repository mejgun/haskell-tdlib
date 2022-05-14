{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data MessageLink = -- | Contains an HTTPS link to a message in a supergroup or channel @link Message link @is_public True, if the link will work for non-members of the chat
  MessageLink
  { -- |
    is_public :: Maybe Bool,
    -- |
    link :: Maybe String
  }
  deriving (Eq)

instance Show MessageLink where
  show
    MessageLink
      { is_public = is_public_,
        link = link_
      } =
      "MessageLink"
        ++ U.cc
          [ U.p "is_public" is_public_,
            U.p "link" link_
          ]

instance T.FromJSON MessageLink where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageLink" -> parseMessageLink v
      _ -> mempty
    where
      parseMessageLink :: A.Value -> T.Parser MessageLink
      parseMessageLink = A.withObject "MessageLink" $ \o -> do
        is_public_ <- o A..:? "is_public"
        link_ <- o A..:? "link"
        return $ MessageLink {is_public = is_public_, link = link_}
  parseJSON _ = mempty

instance T.ToJSON MessageLink where
  toJSON
    MessageLink
      { is_public = is_public_,
        link = link_
      } =
      A.object
        [ "@type" A..= T.String "messageLink",
          "is_public" A..= is_public_,
          "link" A..= link_
        ]
