-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Seconds where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data Seconds = 
 Seconds { seconds :: Maybe Float }  deriving (Show, Eq)

instance T.ToJSON Seconds where
 toJSON (Seconds { seconds = seconds }) =
  A.object [ "@type" A..= T.String "seconds", "seconds" A..= seconds ]

instance T.FromJSON Seconds where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "seconds" -> parseSeconds v
   _ -> mempty
  where
   parseSeconds :: A.Value -> T.Parser Seconds
   parseSeconds = A.withObject "Seconds" $ \o -> do
    seconds <- optional $ o A..: "seconds"
    return $ Seconds { seconds = seconds }