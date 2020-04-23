-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Error where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data Error = 
 Error { message :: Maybe String, code :: Maybe Int }  deriving (Show)

instance T.ToJSON Error where
 toJSON (Error { message = message, code = code }) =
  A.object [ "@type" A..= T.String "error", "message" A..= message, "code" A..= code ]

instance T.FromJSON Error where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "error" -> parseError v
   _ -> mempty
  where
   parseError :: A.Value -> T.Parser Error
   parseError = A.withObject "Error" $ \o -> do
    message <- optional $ o A..: "message"
    code <- optional $ o A..: "code"
    return $ Error { message = message, code = code }