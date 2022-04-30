-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveBackground where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Removes background from the list of installed backgrounds 
-- 
-- __background_id__ The background identifier
data RemoveBackground = 

 RemoveBackground { background_id :: Maybe Int }  deriving (Eq)

instance Show RemoveBackground where
 show RemoveBackground { background_id=background_id } =
  "RemoveBackground" ++ U.cc [U.p "background_id" background_id ]

instance T.ToJSON RemoveBackground where
 toJSON RemoveBackground { background_id = background_id } =
  A.object [ "@type" A..= T.String "removeBackground", "background_id" A..= background_id ]

instance T.FromJSON RemoveBackground where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeBackground" -> parseRemoveBackground v
   _ -> mempty
  where
   parseRemoveBackground :: A.Value -> T.Parser RemoveBackground
   parseRemoveBackground = A.withObject "RemoveBackground" $ \o -> do
    background_id <- mconcat [ o A..:? "background_id", readMaybe <$> (o A..: "background_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ RemoveBackground { background_id = background_id }
 parseJSON _ = mempty
