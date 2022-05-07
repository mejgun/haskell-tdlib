{-# LANGUAGE OverloadedStrings #-}

module TD.Data.ResetPasswordResult where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Represents result of 2-step verification password reset
data ResetPasswordResult
  = -- | The password was reset
    ResetPasswordResultOk
  | -- | The password reset request is pending @pending_reset_date Point in time (Unix timestamp) after which the password can be reset immediately using resetPassword
    ResetPasswordResultPending
      { -- |
        pending_reset_date :: Maybe Int
      }
  | -- | The password reset request was declined @retry_date Point in time (Unix timestamp) when the password reset can be retried
    ResetPasswordResultDeclined
      { -- |
        retry_date :: Maybe Int
      }
  deriving (Eq)

instance Show ResetPasswordResult where
  show ResetPasswordResultOk =
    "ResetPasswordResultOk"
      ++ U.cc
        []
  show
    ResetPasswordResultPending
      { pending_reset_date = pending_reset_date
      } =
      "ResetPasswordResultPending"
        ++ U.cc
          [ U.p "pending_reset_date" pending_reset_date
          ]
  show
    ResetPasswordResultDeclined
      { retry_date = retry_date
      } =
      "ResetPasswordResultDeclined"
        ++ U.cc
          [ U.p "retry_date" retry_date
          ]

instance T.FromJSON ResetPasswordResult where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "resetPasswordResultOk" -> parseResetPasswordResultOk v
      "resetPasswordResultPending" -> parseResetPasswordResultPending v
      "resetPasswordResultDeclined" -> parseResetPasswordResultDeclined v
      _ -> mempty
    where
      parseResetPasswordResultOk :: A.Value -> T.Parser ResetPasswordResult
      parseResetPasswordResultOk = A.withObject "ResetPasswordResultOk" $ \o -> do
        return $ ResetPasswordResultOk {}

      parseResetPasswordResultPending :: A.Value -> T.Parser ResetPasswordResult
      parseResetPasswordResultPending = A.withObject "ResetPasswordResultPending" $ \o -> do
        pending_reset_date_ <- mconcat [o A..:? "pending_reset_date", U.rm <$> (o A..: "pending_reset_date" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ResetPasswordResultPending {pending_reset_date = pending_reset_date_}

      parseResetPasswordResultDeclined :: A.Value -> T.Parser ResetPasswordResult
      parseResetPasswordResultDeclined = A.withObject "ResetPasswordResultDeclined" $ \o -> do
        retry_date_ <- mconcat [o A..:? "retry_date", U.rm <$> (o A..: "retry_date" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ResetPasswordResultDeclined {retry_date = retry_date_}
  parseJSON _ = mempty

instance T.ToJSON ResetPasswordResult where
  toJSON ResetPasswordResultOk =
    A.object
      [ "@type" A..= T.String "resetPasswordResultOk"
      ]
  toJSON
    ResetPasswordResultPending
      { pending_reset_date = pending_reset_date
      } =
      A.object
        [ "@type" A..= T.String "resetPasswordResultPending",
          "pending_reset_date" A..= pending_reset_date
        ]
  toJSON
    ResetPasswordResultDeclined
      { retry_date = retry_date
      } =
      A.object
        [ "@type" A..= T.String "resetPasswordResultDeclined",
          "retry_date" A..= retry_date
        ]
