{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.GroupCallId where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data GroupCallId = -- | Contains the group call identifier @id Group call identifier
  GroupCallId
  { -- |
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show GroupCallId where
  show
    GroupCallId
      { _id = _id
      } =
      "GroupCallId"
        ++ U.cc
          [ U.p "_id" _id
          ]

instance T.FromJSON GroupCallId where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "groupCallId" -> parseGroupCallId v
      _ -> fail ""
    where
      parseGroupCallId :: A.Value -> T.Parser GroupCallId
      parseGroupCallId = A.withObject "GroupCallId" $ \o -> do
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ GroupCallId {_id = _id_}
  parseJSON _ = fail ""

instance T.ToJSON GroupCallId where
  toJSON
    GroupCallId
      { _id = _id
      } =
      A.object
        [ "@type" A..= T.String "groupCallId",
          "id" A..= _id
        ]
