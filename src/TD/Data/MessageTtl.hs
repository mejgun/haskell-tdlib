{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageTtl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data MessageTtl = -- | Contains default message Time To Live setting (self-destruct timer) for new chats @ttl Message TTL setting, in seconds. If 0, then messages aren't deleted automatically
  MessageTtl
  { -- |
    ttl :: Maybe Int
  }
  deriving (Eq)

instance Show MessageTtl where
  show
    MessageTtl
      { ttl = ttl_
      } =
      "MessageTtl"
        ++ U.cc
          [ U.p "ttl" ttl_
          ]

instance T.FromJSON MessageTtl where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageTtl" -> parseMessageTtl v
      _ -> mempty
    where
      parseMessageTtl :: A.Value -> T.Parser MessageTtl
      parseMessageTtl = A.withObject "MessageTtl" $ \o -> do
        ttl_ <- o A..:? "ttl"
        return $ MessageTtl {ttl = ttl_}
  parseJSON _ = mempty

instance T.ToJSON MessageTtl where
  toJSON
    MessageTtl
      { ttl = ttl_
      } =
      A.object
        [ "@type" A..= T.String "messageTtl",
          "ttl" A..= ttl_
        ]
