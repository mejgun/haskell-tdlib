{-# LANGUAGE OverloadedStrings #-}

module TD.Data.TemporaryPasswordState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data TemporaryPasswordState = -- | Returns information about the availability of a temporary password, which can be used for payments @has_password True, if a temporary password is available @valid_for Time left before the temporary password expires, in seconds
  TemporaryPasswordState
  { -- |
    valid_for :: Maybe Int,
    -- |
    has_password :: Maybe Bool
  }
  deriving (Eq)

instance Show TemporaryPasswordState where
  show
    TemporaryPasswordState
      { valid_for = valid_for,
        has_password = has_password
      } =
      "TemporaryPasswordState"
        ++ U.cc
          [ U.p "valid_for" valid_for,
            U.p "has_password" has_password
          ]

instance T.FromJSON TemporaryPasswordState where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "temporaryPasswordState" -> parseTemporaryPasswordState v
      _ -> mempty
    where
      parseTemporaryPasswordState :: A.Value -> T.Parser TemporaryPasswordState
      parseTemporaryPasswordState = A.withObject "TemporaryPasswordState" $ \o -> do
        valid_for_ <- mconcat [o A..:? "valid_for", U.rm <$> (o A..: "valid_for" :: T.Parser String)] :: T.Parser (Maybe Int)
        has_password_ <- o A..:? "has_password"
        return $ TemporaryPasswordState {valid_for = valid_for_, has_password = has_password_}
  parseJSON _ = mempty

instance T.ToJSON TemporaryPasswordState where
  toJSON
    TemporaryPasswordState
      { valid_for = valid_for,
        has_password = has_password
      } =
      A.object
        [ "@type" A..= T.String "temporaryPasswordState",
          "valid_for" A..= valid_for,
          "has_password" A..= has_password
        ]
