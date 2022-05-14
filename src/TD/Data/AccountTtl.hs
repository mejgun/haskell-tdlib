{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.AccountTtl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data AccountTtl = -- | Contains information about the period of inactivity after which the current user's account will automatically be deleted @days Number of days of inactivity before the account will be flagged for deletion; 30-366 days
  AccountTtl
  { -- |
    days :: Maybe Int
  }
  deriving (Eq)

instance Show AccountTtl where
  show
    AccountTtl
      { days = days_
      } =
      "AccountTtl"
        ++ U.cc
          [ U.p "days" days_
          ]

instance T.FromJSON AccountTtl where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "accountTtl" -> parseAccountTtl v
      _ -> mempty
    where
      parseAccountTtl :: A.Value -> T.Parser AccountTtl
      parseAccountTtl = A.withObject "AccountTtl" $ \o -> do
        days_ <- mconcat [o A..:? "days", U.rm <$> (o A..: "days" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ AccountTtl {days = days_}
  parseJSON _ = mempty

instance T.ToJSON AccountTtl where
  toJSON
    AccountTtl
      { days = days_
      } =
      A.object
        [ "@type" A..= T.String "accountTtl",
          "days" A..= days_
        ]
