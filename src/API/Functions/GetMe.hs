-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMe where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns the current user
data GetMe = 
 GetMe deriving (Show, Eq)

instance T.ToJSON GetMe where
 toJSON (GetMe {  }) =
  A.object [ "@type" A..= T.String "getMe" ]

instance T.FromJSON GetMe where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMe" -> parseGetMe v
   _ -> mempty
  where
   parseGetMe :: A.Value -> T.Parser GetMe
   parseGetMe = A.withObject "GetMe" $ \o -> do
    return $ GetMe {  }