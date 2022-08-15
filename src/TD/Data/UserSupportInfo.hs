{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.UserSupportInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FormattedText as FormattedText
import qualified Utils as U

-- |
data UserSupportInfo = -- | Contains custom information about the user @message Information message @author Information author @date Information change date
  UserSupportInfo
  { -- |
    date :: Maybe Int,
    -- |
    author :: Maybe String,
    -- |
    message :: Maybe FormattedText.FormattedText
  }
  deriving (Eq)

instance Show UserSupportInfo where
  show
    UserSupportInfo
      { date = date_,
        author = author_,
        message = message_
      } =
      "UserSupportInfo"
        ++ U.cc
          [ U.p "date" date_,
            U.p "author" author_,
            U.p "message" message_
          ]

instance T.FromJSON UserSupportInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "userSupportInfo" -> parseUserSupportInfo v
      _ -> mempty
    where
      parseUserSupportInfo :: A.Value -> T.Parser UserSupportInfo
      parseUserSupportInfo = A.withObject "UserSupportInfo" $ \o -> do
        date_ <- o A..:? "date"
        author_ <- o A..:? "author"
        message_ <- o A..:? "message"
        return $ UserSupportInfo {date = date_, author = author_, message = message_}
  parseJSON _ = mempty

instance T.ToJSON UserSupportInfo where
  toJSON
    UserSupportInfo
      { date = date_,
        author = author_,
        message = message_
      } =
      A.object
        [ "@type" A..= T.String "userSupportInfo",
          "date" A..= date_,
          "author" A..= author_,
          "message" A..= message_
        ]
