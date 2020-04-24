-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetTextEntities where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetTextEntities = 
 GetTextEntities { text :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON GetTextEntities where
 toJSON (GetTextEntities { text = text }) =
  A.object [ "@type" A..= T.String "getTextEntities", "text" A..= text ]

instance T.FromJSON GetTextEntities where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getTextEntities" -> parseGetTextEntities v
   _ -> mempty
  where
   parseGetTextEntities :: A.Value -> T.Parser GetTextEntities
   parseGetTextEntities = A.withObject "GetTextEntities" $ \o -> do
    text <- optional $ o A..: "text"
    return $ GetTextEntities { text = text }