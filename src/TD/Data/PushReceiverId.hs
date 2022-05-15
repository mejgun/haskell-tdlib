{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PushReceiverId where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data PushReceiverId = -- | Contains a globally unique push receiver identifier, which can be used to identify which account has received a push notification @id The globally unique identifier of push notification subscription
  PushReceiverId
  { -- |
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show PushReceiverId where
  show
    PushReceiverId
      { _id = _id_
      } =
      "PushReceiverId"
        ++ U.cc
          [ U.p "_id" _id_
          ]

instance T.FromJSON PushReceiverId where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "pushReceiverId" -> parsePushReceiverId v
      _ -> mempty
    where
      parsePushReceiverId :: A.Value -> T.Parser PushReceiverId
      parsePushReceiverId = A.withObject "PushReceiverId" $ \o -> do
        _id_ <- U.rm <$> (o A..:? "id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ PushReceiverId {_id = _id_}
  parseJSON _ = mempty

instance T.ToJSON PushReceiverId where
  toJSON
    PushReceiverId
      { _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "pushReceiverId",
          "id" A..= U.toS _id_
        ]
