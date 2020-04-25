-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchBackground where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SearchBackground = 
 SearchBackground { name :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON SearchBackground where
 toJSON (SearchBackground { name = name }) =
  A.object [ "@type" A..= T.String "searchBackground", "name" A..= name ]

instance T.FromJSON SearchBackground where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchBackground" -> parseSearchBackground v
   _ -> mempty
  where
   parseSearchBackground :: A.Value -> T.Parser SearchBackground
   parseSearchBackground = A.withObject "SearchBackground" $ \o -> do
    name <- o A..:? "name"
    return $ SearchBackground { name = name }