{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.CallId where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data CallId = -- | Contains the call identifier @id Call identifier
  CallId
  { -- |
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show CallId where
  show
    CallId
      { _id = _id
      } =
      "CallId"
        ++ U.cc
          [ U.p "_id" _id
          ]

instance T.FromJSON CallId where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "callId" -> parseCallId v
      _ -> fail ""
    where
      parseCallId :: A.Value -> T.Parser CallId
      parseCallId = A.withObject "CallId" $ \o -> do
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ CallId {_id = _id_}
  parseJSON _ = fail ""

instance T.ToJSON CallId where
  toJSON
    CallId
      { _id = _id
      } =
      A.object
        [ "@type" A..= T.String "callId",
          "id" A..= _id
        ]
